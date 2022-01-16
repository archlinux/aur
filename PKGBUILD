# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=fakepearl
pkgname=ttf-${_pkgname}-git
pkgver=1.1.r31.1bb7821
pkgrel=1
pkgdesc="A free font family derived from open-huninn-font."
arch=('any')
license=('OFL')
url="https://github.com/max32002/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" tw/*.ttf

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 fake_pearl_history.md "${pkgdir}/usr/share/doc/${pkgname%-git}/CHANGELOG.md"
  install -Dm644 SIL_Open_Font_License_1.1.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/OFL.txt"
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags --always | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}
