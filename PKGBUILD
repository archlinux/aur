# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=compizconfig-backend-kconfig4
pkgver=0.8.8
pkgrel=1
pkgdesc="Compizconfig backend for kconfig4"
arch=('i686' 'x86_64')
url="http://www.compiz.org/"
license=('GPL2')
depends=('libcompizconfig' 'kdelibs' 'libxcomposite' 'libxinerama')
makedepends=('cmake' 'automoc4')
groups=('compiz-fusion-kde' 'compiz-fusion')
source=("http://releases.compiz.org/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('d7a29339b47233ad53fe04ca0136fdb511b945ac')

build()
{
	cd "${srcdir}"
	mkdir build
	cd build
	cmake "../${pkgname}-${pkgver}" \
			-DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}" install
}
