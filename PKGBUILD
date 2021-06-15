# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libvtflib-git
pkgver=1.0.r1.a501ba5
pkgrel=1
pkgdesc="Library to handle Valve's Texture Format"
arch=('any')
url="https://github.com/panzi/VTFLib"
license=('GPL')
depends=('libtxc_dxtn')
makedepends=("git")
makedepends=('cmake')
source=("git+https://github.com/panzi/VTFLib.git")
md5sums=('SKIP')


build() {
	cd VTFLib
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
	make -j`nproc`
}

package() {
	cd "$srcdir/VTFLib"
	make install DESTDIR="$pkgdir"
}
