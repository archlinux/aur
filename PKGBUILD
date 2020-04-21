# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.1.6
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="https://osdn.net/projects/azpainter/"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
makedepends=('libxfixes')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('863d739813010e65e971297a42bc3d56aa696d69b9d4d71aa66f8b302c776b3c')

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	# make -j1
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
