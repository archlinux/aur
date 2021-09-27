# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-aiofile
_name=${pkgname#python-}
pkgver=3.7.2
pkgrel=1
pkgdesc="Real asynchronous file operations with asyncio support"
arch=('any')
url="https://github.com/mosquito/aiofile"
license=('Apache')
depends=('python-caio')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e1c577ab033cf1fd01ff33e033431223c5310254cc41bc3c6bf467e702a29791')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
