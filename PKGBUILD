# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-aiofile
_name=${pkgname#python-}
pkgver=3.7.3
pkgrel=1
pkgdesc="Real asynchronous file operations with asyncio support"
arch=('any')
url="https://github.com/mosquito/aiofile"
license=('Apache')
depends=('python-caio')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('59ffc4ccafc41bf24831d4917cc918e0cc98a5d3a73f3d5738a4faad99f6ef3d')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
