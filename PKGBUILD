# Maintainer: Q Dmitriy krotesk <at> mail <dot> ru
pkgname=python-pkgbuilder
pkgver=1.0.1
pkgrel=3
pkgdesc='Declarative PKGBUILD automatic generation.'
license=('GPL3')
arch=('any')
depends=('python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
url='https://github.com/frefolli/python-pkgbuilder/'
_archive='https://github.com/frefolli/python-pkgbuilder/archive'
source=("$pkgname-$pkgver.tar.gz::$_archive/v$pkgver.tar.gz")
sha256sums=('f84f56d2cd7569a6e83863b6332f834c3a28be55adcdaccc2c61168ac0284735')
build() {
  cd $pkgname-$pkgver
  make BUILD_TYPE=release
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
options=(!debug)
