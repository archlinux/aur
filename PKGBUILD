# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-fr5
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A French Belgian voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/bonjour.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/carte.pho")
sha256sums=('f840031f8267c5eb21f40a94099f170ad6a0871949568bbabbe3287415de79dd'
            '7098e6d2442f532816a3f4f9e685c28a24deaebad85fa21dee7dc8f14ec82331'
            'dbae84598dba221117f6bc86925dd0c4f9e28adddde06880f65032efb8c576e3'
            '631ac0560fdc53d49d146fa4b97e3d7e4b3e3dc4c9dc25740fc6c1ca0d9cd490'
            'f3e5989d4c90e98901f0404d0623197558dce13e9bf70dde65dfbf664f74563e')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../mbrola/${_pkgfile}/README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST" \
    bonjour.pho carte.pho
}
