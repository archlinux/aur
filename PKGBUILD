# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-kiwisolver
pkgver=1.1.0
pkgrel=4
pkgdesc="A fast implementation of the Cassowary constraint solver"
url="https://github.com/nucleic/kiwi"
license=(PerlArtistic)
arch=(x86_64)
depends=(python2-setuptools)
source=("https://github.com/nucleic/kiwi/archive/$pkgver.tar.gz")
sha256sums=('48168c0ace18319c649e31907f6d8586f648e503560f506f128798b99393bcdb')

build() {
  cd "$srcdir"/kiwi-$pkgver/
  python2 setup.py build
}

package() {
  cd "$srcdir"/kiwi-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
