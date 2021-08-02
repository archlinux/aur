# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-aiofile
_name=${pkgname#python-}
pkgver=3.6.0
pkgrel=1
pkgdesc="Real asynchronous file operations with asyncio support"
arch=('any')
url="https://github.com/mosquito/aiofile"
license=('Apache')
depends=('python-caio=0.9.0')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('864940bf81c3d20fb079c8a0e9773a63539d1cfcef03ceeffead2551846bc513')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
