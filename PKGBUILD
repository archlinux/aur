# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.1.5
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="https://osdn.net/projects/azpainter/"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
makedepends=('libxfixes')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('de96d3f33c7de53ff2ad1cd13be98d4bd595c86d1b75e21f509afd56e5cd9dc7')

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
