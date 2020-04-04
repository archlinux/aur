# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-lt1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Lithuanian male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/debesug.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/kiekvg.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/polangg.pho")
sha256sums=('caecd03a27c9fd064dfc718ba28e3523fd6eb5625197eb11902ccbb8671352d7'
            '66e5ec071180d9839b569243a2a07a7a14f220e3fa1c18d8124da7b8df96ba3d'
            '8e56087fa89fddb0e7c89bfa5d0afb0e5c8c0b50f2b334cd20ff473ff9e9a54d'
            '19e9120c6c469d83fdbfebbe8a7c22c92df27f8d4cb0551aa5a9e6e0814c88cf'
            'b0395ac5607d9bd4ba74f20002bd53ad8a4a7227dc1e161dd555acdb5393611f'
            '9283e6fd0351acc3bdc751db0625dfadfa93ddbb041dd5142f671a00b1222423'
            '546afe6b786ca8aa2b48e0b8e133c7175a868cea39e198fb1a57acf760c041cd')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    mbroli.ini debesug.pho kiekvg.pho polangg.pho
}
