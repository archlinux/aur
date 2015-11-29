# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=gwenview-kde4
pkgver=4.14.3
pkgrel=1
pkgdesc='A fast and easy to use image viewer for KDE'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://kde.org/applications/graphics/gwenview'
license=('GPL')
groups=('kde' 'kdegraphics')
depends=('qt4' 'exiv2' 'libbaloo4' 'libkipi4' 'libkdcraw4' 'kdebase-lib' 'kdebase-runtime')
makedepends=('make' 'gcc' 'cmake' 'automoc4')
conflicts=('kdegraphics-gwenview' 'gwenview')
provides=('gwenview')
source=("http://download.kde.org/stable/${pkgver}/src/gwenview-${pkgver}.tar.xz")
sha1sums=('dfa98856fbcd7e51050f23716d7f24dab264bf12')
install=$pkgname.install

prepare()
{
	mkdir -p build
}

build()
{
	cd build
	cmake ../gwenview-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF
	make
}

package()
{
	cd build
	make DESTDIR="${pkgdir}" install
}
