# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=qvtf-git
pkgver=1.0.0
pkgrel=1
pkgdesc="QImageIO plugin to load Valve Texture Files in QT Programs (View VTF in QT Programs)"
arch=('any')
url="https://github.com/HurricanePootis/qvtf"
license=('GPL')
depends=('libtxc_dxtn' 'vtflib-git')
makedepends=('cmake')
source=("git+https://github.com/HurricanePootis/qvtf.git")
md5sums=('SKIP')


build() {
	cd qvtf
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
	make -j`nproc`
}

package() {
	cd "$srcdir/qvtf"
	make install DESTDIR="$pkgdir"
}
