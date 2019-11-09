# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vine
pkgver=1.3.0
pkgrel=3
pkgdesc="Promises, promises, promises"
arch=('any')
license=('BSD')
url="https://github.com/celery/vine"
depends=('python-case')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/celery/vine/archive/v$pkgver.tar.gz")
sha512sums=('cb6ee9fcfcd7e7e23e894fce646c9e8b2300622fcc1811c1547bda90e3756de248ac01e4f812ecbb31dd1798734219d0b8f986354ae16014a7e5d949ab5d994f')

build() {
  cd "$srcdir"/vine-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/vine-$pkgver
  python setup.py test
}

package() {
  cd vine-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
