# Maintainer: Coelacanthus <coelacanthus@outlook.com>
 
pkgname=python-pystun3
pkgver=1.0.0
pkgrel=1
pkgdesc='A Python STUN client for getting NAT type and external IP '
arch=('any')
license=('MIT')
url='https://github.com/talkiq/pystun3'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-coverage' 'python-nose' 'python-prospector' 'python-coveralls')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/talkiq/pystun3/archive/$pkgver.tar.gz")
sha512sums=('3d44205016d44192f3af8e8504e2adc7ce31d1a40042c3cd15c61f207fc923338dc30f0c093dc8ac9269a4e629a8bded6fd4d507b3bb3321de480fbe6fc7804e')
 
prepare() {
  cp -a pystun3-$pkgver
}

build() {
  cd "$srcdir"/pystun3-$pkgver
  python setup.py build
}
 
check() {
  cd "$srcdir"/pystun3-$pkgver
  python setup.py pytest
}
 
package() {
  cd pystun3-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
 
# vim:set ts=2 sw=2 et:
