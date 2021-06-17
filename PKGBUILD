# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=u3d
pkgver=1.4.5
pkgrel=2
pkgdesc="U3D is a format for 3D models that can be embedded into PDF and viewed in Adobe Acrobat/Reader"
arch=(i686 x86_64)
url="https://github.com/ningfei/u3d"
license=('Apache')
depends=(libpng libjpeg)
provides=(IDTFConverter u3dlib)
makedepends=(cmake)
source=("${pkgname}.zip::${url}/archive/master.zip")
md5sums=('75c2fa1dff7068f62ecaf5b4b7bfe297')

build() {
	cmake -S "${srcdir}/${pkgname}-master" -B build \
		-DCMAKE_CXX_FLAGS=-std=gnu++11 \
		-DCMAKE_INSTALL_PREFIX="/usr/" \
		-DCMAKE_BUILD_TYPE=Release \
		-DU3D_SHARE=ON
	make -C build
}

package() {
	make -C build DESTDIR=${pkgdir} install
}
