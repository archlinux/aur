# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-nose-randomly
pkgver=1.2.6
pkgrel=6
pkgdesc="Nose plugin to randomly order tests and control random.seed."
url="https://github.com/adamchainz/nose-randomly"
license=('BSD')
arch=('any')
depends=('python-nose')
makedepends=('python-setuptools')
checkdepends=('python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adamchainz/nose-randomly/archive/$pkgver.tar.gz")
sha512sums=('61f3b056911a9ebbba81594afa11492b760e98a1d8382c67e35afcf1059422b6589a7c214068fc233d96617dfb37c99ee14e77b92d5ec94a29eeab77a0520603')

build() {
  cd "$srcdir"/nose-randomly-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/nose-randomly-$pkgver
  python setup.py nosetests
}

package() {

  cd nose-randomly-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
