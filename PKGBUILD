# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python2-phonenumbers
pkgver=8.10.22
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache')
depends=('python2')
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/daviddrysdale/python-phonenumbers/archive/v$pkgver.tar.gz")
sha512sums=('b5434f895b590285d2347c14bdd4b46ac1fb4c9867419846b80cbc2e7ab9d23e2cf04ba8178f493ba2cf01514e23eac64160ffb6b427459e929112eda49e93d4')

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
