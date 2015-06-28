# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcur2png
pkgver=0.7.1
pkgrel=3
pkgdesc='Convert X cursors to PNG images'
arch=('i686' 'x86_64')
url="http://cli-apps.org/content/show.php/xcur2png?content=86010"
license=('GPL')
depends=('libpng' 'libxcursor')
source=("${pkgname}-${pkgver}.tar.gz::http://cli-apps.org/CONTENT/content-files/86010-${pkgname}-${pkgver}.tar.gz")
sha256sums=('bc6a062fdb48615a7159ed56ef3d2011168cd8a9decaf1d8a4e316d3064132c9')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}

