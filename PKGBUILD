# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=swei-gothic
pkgname=ttf-${_pkgname}-git
pkgver=2.129.r30.9fbdd43
pkgrel=1
pkgdesc="Swei Gothic-derived from Noto Sans CJK font family with a more concise & modern look."
arch=('any')
license=('OFL')
url="https://github.com/max32002/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" CJK\ */*.ttf

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 change_log.md "${pkgdir}/usr/share/doc/${pkgname%-git}/CHANGELOG.md"
  install -Dm644 SIL_Open_Font_License_1.1.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/OFL.txt"
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags --always | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}
