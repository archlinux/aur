# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=mbrola-voices-id1
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="An Indonesian male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/Test/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/Test/i_am_working.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/Test/welcome_to_indonesia.pho")
sha256sums=('ef0254a32f632468b799c95ff9256bd6f81aa8900f619262618959ad68fa75d0'
            '89a85157d9b5112788e501456970bed6cabd980e8016fc1cd33d02a3de9fef29'
            'd63a88b3afa1372ac9138ed5082687a0c00f2cd2987ee0cbf0eb59f65f828803'
            'e8ce5047b79c902d32a138f4ede71c7dc683aa0df614b524fd74bfb0158a285a'
            'd4f0dd82fdeae6162485727a0d24410e32f80100e64a7fd77ac7168f70741ede'
            'dffe2902bdbbf68ce0173fec22c8ae9354cd7caf6c5f286ffb5314cec17e34b3')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/Test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/Test" \
    mbroli.ini i_am_working.pho welcome_to_indonesia.pho
}
