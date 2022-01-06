# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libvtflib-git
pkgver=r42.a6e3084
pkgrel=1
pkgdesc="Library to handle Valve's Texture Format"
arch=('x86_64')
url="https://github.com/panzi/VTFLib"
license=('GPL')
depends=('libtxc_dxtn')
makedepends=('cmake' 'git' 'extra-cmake-modules' 'gcc')
source=("git+https://github.com/panzi/VTFLib.git")
md5sums=('SKIP')


pkgver() {
cd $srcdir/VTFLib
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/VTFLib"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
	make
}

package() {
	cd "$srcdir/VTFLib"
	make install DESTDIR="$pkgdir"
}
