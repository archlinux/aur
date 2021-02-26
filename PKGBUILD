# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vtflib-git
pkgver=1.0.0
pkgrel=2
pkgdesc="Library to handle Valve's Texture Format"
arch=('any')
url="https://github.com/Silverlan/VTFLib"
license=('GPL')
depends=('libtxc_dxtn')
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
