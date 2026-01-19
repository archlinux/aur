# Maintainer: Anton Samartsev <kycko at archlinux dot org>

_cname="UbuntuSans-fonts"
_uname="Ubuntu-Sans-fonts"

pkgname=ttf-ubuntu-sans
pkgver=1.006
pkgrel=1
pkgdesc="Ubuntu Font Family, improved and expanded by the same author. This package provides only non-monospaced fonts. Ubuntu Sans Mono is available in the separate package."

arch=("any")
url="https://github.com/canonical/${_uname}"
license=("Ubuntu-font-1.0")

source=("${url}/releases/download/v${pkgver}/${_cname}-${pkgver}.zip"
        "https://raw.githubusercontent.com/canonical/${_uname}/refs/tags/v${pkgver}/LICENCE.txt")
sha256sums=('20aa7af47beaa6d64327782f7bf60df375edeedbdee2fe407e0bf9721890fb83'
            '2f0015108d68627bd788d313f529c21ff4da2c2c42a5e1f3883acc83480f9002')

package() {
  pushd ${_cname}-${pkgver}/otf
  for file in *.otf; do
    install -Dm644 "$file" "${pkgdir}/usr/share/fonts/ubuntu-sans-mono/$file"
  done
  popd

  install -Dm644 LICENCE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
