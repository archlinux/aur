# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.23.0
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
depends=('python-cryptography' 'python-josepy' 'python-pyopenssl' 'python-pyrfc3339' 'python-pytz'
         'python-requests' 'python-requests-toolbelt' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('a4f2a52ee2a12de4bad6de4726a4a4ebd1eb4aa89d6c723b2ffd51d5551feca6fbc10b040a0ece0a8c083b874103319f83ec908e6f55cdd854ca59f64735c532')

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
