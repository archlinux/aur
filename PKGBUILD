# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=funkcio-git
pkgver=0.3
pkgrel=1
pkgdesc="Draw functions from points"
arch=('x86_64')
url="https://github.com/wbernard/funkcio"
license=('GPL3')
depends=('lapack' 'pybind11' 'python-numpy' 'python-scipy')
makedepends=('meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

build() {
    arch-meson ${pkgname%-git} build
    meson compile -C build
}

package() {
  cd "$srcdir"
    DESTDIR="${pkgdir}" ninja -C build install
}
