# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python2-phonenumbers
pkgver=8.10.13
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache')
depends=('python2')
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/daviddrysdale/python-phonenumbers/archive/v$pkgver.tar.gz")
sha512sums=('ca5dd22f8184b44d2d373dbfe090b497147e4f0855e6ba597a878b7147b8d58290b69a7f92bba6782530469338ea867b0538014405945f13c74496dc1fae2ef5')

build() {
  cd python-phonenumbers-$pkgver
  python2 setup.py build
}

check() {
  cd python-phonenumbers-$pkgver
  python2 setup.py test
}

package() {
  cd python-phonenumbers-$pkgver
  python2 setup.py install -O1 --root "$pkgdir"
}
