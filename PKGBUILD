# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-chai
pkgver=1.1.2
pkgrel=7
pkgdesc="Easy to use mocking, stubbing and spying framework."
arch=('any')
url="https://github.com/agoragames/chai"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/c/chai/chai-$pkgver.tar.gz")
sha256sums=('ff8d2b6855f660cd23cd5ec79bd10264d39f24f6235773331b48e7fcd637d6cc')

build() {
  cd chai-$pkgver
  python setup.py build
}

check() {
  cd chai-$pkgver
  nosetests
}

package() {
  cd chai-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
