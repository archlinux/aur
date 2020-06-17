# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Buce <dmbuce@gmail.com>

_name=NBT
pkgname=python-${_name,,}
pkgver=1.5.0
pkgrel=2
pkgdesc="Named Binary Tag Reader/Writer"
url="https://github.com/twoolie/$_name"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/version-$pkgver.tar.gz")
sha256sums=('068111bf5d9e73156cd6d627b3d69c782e89af96e328dd7e91a971a453ba9951')

build() {
  cd "$_name-version-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-version-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
