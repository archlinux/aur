# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vine
pkgver=5.0.0
pkgrel=1
pkgdesc="Promises, promises, promises"
arch=('any')
license=('BSD')
url="https://github.com/celery/vine"
depends=('python-case')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/celery/vine/archive/v$pkgver.tar.gz")
sha512sums=('db0598b05235a61416958e09582b2b1cd504ba54c04e325ade552fa76886463f447d8f6b423a0f9db777ae441c4898898e9acf2ed2e9c1d5c040bc703b226e97')

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
