# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

pkgname=python-overpy
pkgver=0.4
pkgrel=1
pkgdesc="Python Wrapper to access the Overpass API"
arch=(any)
url="https://github.com/DinoTools/python-overpy"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("$pkgname-$pkgver".tar.gz::"$url"/archive/"$pkgver".tar.gz)
sha256sums=('0af30d3ef4e05d7a163bb4cd78f5f7a86ef7a427d99a281d0d782c3dc4b8f5c5')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/tests.\*\"/&, "tests"/' setup.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
