# Maintainer: Oskar Roesler <oskar at oskar-roesler dot de>

pkgname=python2-asn1crypto
pkgver=1.4.0
pkgrel=1
arch=('any')
license=('MIT')
pkgdesc="Python ASN.1 library with a focus on performance and a python2ic API"
url="https://github.com/wbond/asn1crypto"
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wbond/asn1crypto/archive/$pkgver.tar.gz")
sha512sums=('989e4e0650252c29477d71263549b99f2c51c87f0768c20264b3de65f32edd8e7922e8af23bb1a7e29567a4ad8c4c5d596cdf7db3c766352c7f19d4f93361cd0')

build() {
  cd "$srcdir"/asn1crypto-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/asn1crypto-$pkgver
  python2 run.py tests
}

package() {
  cd asn1crypto-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/python2-asn1crypto/LICENSE
}
