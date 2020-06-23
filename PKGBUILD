# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-cgen
_pkgname=cgen
pkgver=2020.1
pkgrel=1
pkgdesc="A C/C++ source generation from an AST"
arch=('any')
url="https://github.com/inducer/cgen"
license=('MIT')
depends=('python>=3.6')
source=($url/archive/v$pkgver.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://github.com/inducer/cgen/archive/v$pkgver.tar.gz)
sha256sums=('3d7309225294b989a4759a9362a5cb8487ac69d97ef3a49e850905fa1c8d852f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}
