# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.8.0
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
depends=('python-setuptools' 'python-pyopenssl' 'python-pyrfc3339' 'python-pytz' 'python-requests'
         'python-six' 'python-josepy' 'python-mock' 'python-requests-toolbelt')
checkdepends=('python-pytest-runner')
source=("https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('b6e9d8d1c5fa6a0e1cb6eb327adffe79348ca6ef3c15d869a89b20ff3330992928d1edf5dbacb2420da4ebc8148d492e345a81c1dca044c93443eb8b4700ce89')

build() {
  cd acme-$pkgver
  python setup.py build
}

check() {
  cd acme-$pkgver
  python setup.py pytest
}

package() {
  cd acme-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
