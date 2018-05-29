# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
pkgname=python-deepdiff
pkgver=3.3.0
pkgrel=1
pkgdesc="Deep Difference of dictionaries, iterables, strings and other objects. It will recursively look for all the changes."
arch=('any')
url="https://github.com/seperman/deepdiff"
license=('MIT')
depends=('python' 'python-jsonpickle')
source=(https://github.com/seperman/deepdiff/archive/v${pkgver}.tar.gz)
sha1sums=('119febf1e4f0d498b03905964cf948e266a6cd2a')
sha256sums=('2938706a52b8f02e5683d41be3973f7407ec0315e89791b79e897134a59482d3')
sha512sums=('da37d74ab7a3b2b417d2672e78f4d9e0747dcfc8657b48abf61e0142984716fadceeacfe6b42406da3b7583a187e2394a6ae41696a6d01ab49347c8a955b5f26')

build() {
  cd "$srcdir/deepdiff-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/deepdiff-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

