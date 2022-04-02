# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=Amulet-NBT
pkgname=python-${_name,,}
pkgver=1.0.4
pkgrel=1
pkgdesc='A Python and Cython library for reading and writing binary NBT and stringified NBT'
arch=('x86_64')
url="https://github.com/Amulet-Team/$_name"
license=('unknown')
depends=('python' 'python-numpy')
makedepends=('cython' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('eba0f4c3ab84c5803be446b1229d7fe195cd08a00d60d40ce83242bfcf11f316')

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
