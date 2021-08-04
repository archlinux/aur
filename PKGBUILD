# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.18.0
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
depends=('python-cryptography' 'python-josepy' 'python-pyopenssl' 'python-pyrfc3339' 'python-pytz'
         'python-requests' 'python-requests-toolbelt' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('067c6b3e970bd4b15d8d56d00ec646c06cdcfc9bd29928dc71eb59a52f058814d96fcf1e283080707445271c1cd7bed78451c44838738d53010f6d52a3a7fe83')

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
