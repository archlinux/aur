# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=0.33.0
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
depends=('python-setuptools' 'python-pyopenssl' 'python-pyrfc3339' 'python-pytz' 'python-requests'
         'python-six' 'python-josepy' 'python-mock' 'python-requests-toolbelt')
checkdepends=('python-pytest-runner')
source=("https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('40b88f5b16eed320304d11391aa179d8fc757c71f6e3603f41f476a134079f66e7b9ddfa6685c5408729caa2af971f4ec462d9ea12af6086f608897d5f13bcee')

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
