# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python-asynctest
_pkgname=${pkgname#python-}
pkgver=0.12.2
pkgrel=1
pkgdesc="Enhance the standard unittest package with features for testing asyncio libraries."
arch=('any')
url="https://github.com/Martiusweb/asynctest"
license=('Apache')
depends=('python-pyserial' 'python-pyusb')
makedepends=('git')
provides=('pylms7002m')
conflicts=('pylms7002m')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5506e9462d627dc533a407168fe82183623993a4e0336e5805caba75920eb579')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
