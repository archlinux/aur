# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
pkgname=python2-kitchen
_pkgname=kitchen
pkgver=1.2.5
pkgrel=1
pkgdesc="Kitchen contains a cornucopia of useful code"
arch=('any')
url="https://github.com/fedora-infra/kitchen"
license=('LGPL')
depends=('python2' )
makedepends=('python2' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fedora-infra/kitchen/archive/v$pkgver.tar.gz")
md5sums=('35490785ed23c91bad1c083c7adbc39e')

build() {
  cd "$_pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
