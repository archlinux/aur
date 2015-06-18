# Maintainer: Hanspeter Portner <dev[at]open-music-kontrollers[dot]ch>
pkgname=dfuse_pack
pkgver=0.1.2
pkgrel=1
pkgdesc="A DfuSe packer (USB device firmware upgrade STMicroelectronics extension)"
arch=('i686' 'x86_64')
url="https://github.com/OpenMusicKontrollers/dfuse_pack/"
license=('Artistic2.0')
depends=('efl')
makedepends=('pkg-config' 'cmake')
source=(https://github.com/OpenMusicKontrollers/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('fd3dbe3f4f08e9d5ee49da736b149ca1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd build
  cmake \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release \
		..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	cd build
	make DESTDIR="$pkgdir/" install
}
