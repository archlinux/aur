# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.1.4
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="https://osdn.net/projects/azpainter/"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
makedepends=('libxfixes')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('200dba9b443888054172fd13c8d9045d1556210834a46edaa0267bc80a2bad30')

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	# make -j1
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install-strip
}
