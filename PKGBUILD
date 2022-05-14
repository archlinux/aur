# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=python-xmodem
_pkgname=${pkgname#python-}
pkgver=0.4.6
pkgrel=1
pkgdesc="Python XMODEM protocol implementation"
arch=('any')
url="https://github.com/tehmaze/xmodem"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a0018569ad14a97b004d3a0385f466b577faa19a9f8356dc9b87e13085360990169dd0b1e7e91929c8416e05a23e5890dd38a00194313c40c1a9c96e3d64db60')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mkdir -p $pkgdir/usr/share/doc
  mv $pkgdir/usr/doc $pkgdir/usr/share/doc/$pkgname
}
