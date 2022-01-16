# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=naikaifont
pkgname=ttf-${_pkgname%font}-git
pkgver=1.0.r31.f0f396f
pkgrel=1
pkgdesc="A free font family derived from KouzanBrushFont."
arch=('any')
license=('OFL')
url="https://github.com/max32002/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" tw/*.ttf

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 ${_pkgname}_history.md "${pkgdir}/usr/share/doc/${pkgname%-git}/CHANGELOG.md"
  install -Dm644 SIL_Open_Font_License_1.1.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/OFL.txt"
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags --always | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}
