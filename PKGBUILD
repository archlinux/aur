# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=Amulet-NBT
pkgname=python-${_name,,}
pkgver=1.2.1
pkgrel=1
pkgdesc='A Python and Cython library for reading and writing binary NBT and stringified NBT'
arch=('x86_64')
url="https://github.com/Amulet-Team/$_name"
license=('unknown')
depends=('python' 'python-numpy')
makedepends=('cython' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ae340882c269695299d98ab1a8e04b558ece7a03db421c687f4cc93afce677ee')

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
