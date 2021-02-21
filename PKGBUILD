# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=Amulet-NBT
pkgname=python-${_name,,}
pkgver=1.0.3.7
pkgrel=1
pkgdesc='A Python and Cython library for reading and writing binary NBT and stringified NBT'
arch=('x86_64')
url="https://github.com/Amulet-Team/$_name"
license=('unknown')
depends=('python' 'python-numpy')
makedepends=('cython' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ec368da96bed6ff22e7ad7af63e357bbf3d047a09ce950e2ec352394a84445c0')

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
