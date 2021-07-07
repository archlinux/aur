# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.17.0
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
depends=('python-cryptography' 'python-josepy' 'python-pyopenssl' 'python-pyrfc3339' 'python-pytz'
         'python-requests' 'python-requests-toolbelt' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('f60fd0ef2af928f09c33bd40b65a0df9b197a63d50603432bafcfde9511a99228449795c6c042c7e18cbb9f9bab163f0db1b48747d13958fd66fa6fb1a6a1429')

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
