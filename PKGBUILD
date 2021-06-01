# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.16.0
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
depends=('python-cryptography' 'python-josepy' 'python-pyopenssl' 'python-pyrfc3339' 'python-pytz'
         'python-requests' 'python-requests-toolbelt' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('6e34575f6e393b9c5a5bc96490629ff78da9dfbc92ce78bf6d97977876c2bc19188ac5fd932ed581b8af611ebaf22e7370ce331f4b386ea88e23949dedc55893')

build() {
  cd acme-$pkgver
  python setup.py build
}

check() {
  cd acme-$pkgver
  python -m pytest
}

package() {
  cd acme-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
