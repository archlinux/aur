# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-aiofile
_name=${pkgname#python-}
pkgver=3.7.1
pkgrel=1
pkgdesc="Real asynchronous file operations with asyncio support"
arch=('any')
url="https://github.com/mosquito/aiofile"
license=('Apache')
depends=('python-caio')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('068f38b8fce3bae17a324a8dc8aac61f5f71fdd218f14222186cc2be507f92c1')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
