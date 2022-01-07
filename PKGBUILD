# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-caio
_name=${pkgname#python-}
pkgver=0.9.3
pkgrel=1
pkgdesc="Linux AIO c python bindings"
arch=('x86_64')
url="https://github.com/mosquito/caio"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
#source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2e46b0c008b8baadcac9c8acc66aa1fff58acae779a8a81479795a499f3a6a40')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
