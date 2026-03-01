# Maintainer: jazztickets <amF6enRpY2tldHNAZ21haWwuY29tCg==>
pkgname=choria
pkgver=1.1.2
pkgbuild=17cca1e3
pkgfullname=${pkgname}-${pkgver}-${pkgbuild}
pkgrel=1
pkgdesc="Finally, an MMORPG that's all about grinding and doing chores"
arch=('i686' 'x86_64')
url="https://choria.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'sdl3' 'openal' 'libvorbis' 'libogg' 'libwebp' 'freetype2' 'sqlite' 'zlib')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgfullname}-src.tar.gz")
sha256sums=('09dd4460be84fddb6c0d070bc3e3e90b21bd420dd99c43be07df1a7f4b06bfbe')

build() {
	cd "$srcdir/$pkgfullname"
	cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_VERSION=OFF -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgfullname"
	make DESTDIR="$pkgdir/" install
}
