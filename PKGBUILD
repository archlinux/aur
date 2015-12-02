# Maintainer : sebikul <sebikul@gmail.com>

pkgname=mundus
pkgdesc="Clean and backup your /home folder from old configuration files created by now uninstalled software."
pkgver=3.0.1
pkgrel=1
arch=('any')
url="http://sebikul.github.io/mundus/"
license=('GPL')
conflicts=('mundus-bzr')
depends=('gambas3-gb-image>=3.6.0' \
	 'gambas3-gb-qt4>=3.6.0' \
	 'gambas3-gb-form>=3.6.0' \
	 'gambas3-gb-desktop>=3.6.0' \
	 'gambas3-gb-desktop-x11>=3.6.0' \
	 'gambas3-gb-settings>=3.6.0')
makedepends=('gambas3-devel')
source=(https://github.com/sebikul/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('9606df016d028afa91620a9d9e167290')


build() {
  cd ${srcdir}/${pkgname}-$pkgver

  make
}

package() {
  cd ${srcdir}/${pkgname}-$pkgver

  make DESTDIR=$pkgdir install
}
