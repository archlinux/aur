# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-caio
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc="Linux AIO c python bindings"
arch=('x86_64')
url="https://github.com/mosquito/caio"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
#source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('524fdbcb33d894061b96cb3fa2b01935196612313c76ec69eacf2f0cdab55e6d')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
