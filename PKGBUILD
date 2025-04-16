# Contributor: David Vilar Benet <archlinux at b0rken dot de>

pkgname=explo
pkgver=0.2.2
pkgrel=2
pkgdesc="Human and machine readable web vulnerability testing format"
url="https://github.com/telekom-security/explo"
license=('GPL3')
arch=('any')
depends=('python' 'python-requests' 'python-yaml' 'python-pyquery' 'python-pystache' 'python-eliot' 'python-six')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/telekom-security/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('12893209a15fbeb0e501dd19fb5161b05fbc82e8713b01da919f99371ec49ad7c527e4261ba65495e23d1c3a33eb6b564cc1aad1aa29299ab50cb59dacdf1b7b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
