# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>
pkgname=polyclipping-cpp
pkgver=6.4.2
pkgrel=1
pkgdesc="Line & polygon clipping for C++, based on Vatti's clipping algorithm (aka clipper)"
arch=('x86_64')
url="http://www.angusj.com/delphi/clipper.php"
license=('Boost')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://netix.dl.sourceforge.net/project/polyclipping/clipper_ver$pkgver.zip")
sha256sums=('a14320d82194807c4480ce59c98aa71cd4175a5156645c4e2b3edd330b930627')

build() {
    cmake -B build -S cpp \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVERSION=$pkgver \
        -Wno-dev
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
