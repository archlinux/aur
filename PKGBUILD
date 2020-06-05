# Contributor: Ninez <triplesquarednine AT gmail DOT com>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: sekret (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname="tupitube.desk"
pkgver=0.2.15
pkgrel=1
pkgdesc="A design and authoring tool for digital artists interested in 2D animation."
url="https://www.maefloresta.com/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("qt5-multimedia" "qt5-svg" "quazip" "ffmpeg" "shared-mime-info")
conflicts=("tupi")
makedepends=("ruby" "zlib" "libgl")
source=("http://sourceforge.net/projects/tupi2d/files/Source%20Code/$pkgname-$pkgver.tar.gz" 
        "quazip5.patch")
md5sums=('bba559aba6f17064fee0720336da1aca'
         '5c33ca77bf675939d9fb557b31c2f926')

prepare() {
	cd "${pkgname}"
	patch -p1 -i ../quazip5.patch
}

build() {
	cd "${pkgname}"
	./configure \
		--libdir="/usr/lib" \
		--without-debug
# 		--sharedir="/usr/share/tupi" \
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir" install

}
