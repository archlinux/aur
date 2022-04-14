# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=iansui
pkgname=ttf-${_pkgname}-git
pkgver=v0.940.r1.64efa9f
pkgrel=1
pkgdesc="Free font derived from Source Han Serif."
arch=('any')
license=('OFL')
url="https://github.com/ButTaiwan/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" *.ttf

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 ChangeLog.md "${pkgdir}/usr/share/doc/${pkgname%-git}/CHANGELOG.md"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/OFL.txt"
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags --always | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}
