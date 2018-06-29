# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python2-entrypoints
pkgver=0.2.3
pkgrel=1
pkgdesc="The Python keyring lib provides an easy way to access the system keyring service from python. It can be used in any application that needs safe password storage."
arch=('any')
url="https://github.com/takluyver/entrypoints"
license=('MIT')
depends=('python2-configparser')
makedepends=('python2-setuptools')
provides=('python2-entrypoints')
conflicts=('python2-entrypoints')
source=(
  "$url/archive/$pkgver.tar.gz"
  'https://raw.githubusercontent.com/ddboline/entrypoints/master/setup.py'
)
sha256sums=(
  'a628825648fade6fba8dd94cc26e38340ed840fca3e9d5b7b3dbf755b27bbbdd'
  '1cf89147d8c8592cb4631c45442c27339f7a071f9a1c5d063edc646a69d10f6a'
)

_rname=${pkgname#python2-}

prepare() {
  cp $srcdir/setup.py $srcdir/$_rname-$pkgver/setup.py
}

build() {
  cd $srcdir/$_rname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_rname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1 --skip-build
}
