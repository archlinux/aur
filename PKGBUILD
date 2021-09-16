# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=funkcio
pkgver=0.3
pkgrel=1
pkgdesc="Draw functions from points"
arch=('x86_64')
url="https://github.com/wbernard/funkcio"
license=('GPL3')
depends=('lapack' 'pybind11' 'python-numpy' 'python-scipy')
makedepends=('meson')
checkdepends=('appstream-glib')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ad063330d4760a297ba3989564c3eebb34120cba31d7b28fbff45cd437552c848e007958981d1564c39405261b3b81152f8aee8db65a1d394fc92788c12cf7fb')

build() {
    arch-meson ${pkgname%-git}-$pkgver build
    meson compile -C build
}

package() {
  cd "$srcdir"
    DESTDIR="${pkgdir}" ninja -C build install
}
