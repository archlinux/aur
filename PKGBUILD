# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.19.0
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
depends=('python-cryptography' 'python-josepy' 'python-pyopenssl' 'python-pyrfc3339' 'python-pytz'
         'python-requests' 'python-requests-toolbelt' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('13a830a19fcf42bebad4528c2757b95d01974f775c93afa8338deb71b1c28bce5623fed80949ea8a392740f524b60ef78212148e0892af1a8f3770d602df58e6')

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
