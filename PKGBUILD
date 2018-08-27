# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=spice-html5-git
pkgver=spice.html5.0.1.7.r0.36b8ad3
_pkgver=0.1.7
pkgrel=1
pkgdesc='A HTML5 client for the Spice protocol'
arch=('any')
url='https://www.spice-space.org/spice-html5.html'
license=('GPL')
depends=()
optdepends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::"git+https://gitlab.freedesktop.org/spice/spice-html5.git#tag=spice-html5-${_pkgver}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}
