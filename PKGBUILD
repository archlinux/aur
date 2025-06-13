# Maintainer: jazztickets <amF6enRpY2tldHNAZ21haWwuY29tCg==>
pkgname=choria
pkgver=1.1.1
pkgbuild=f11082f6
pkgfullname=${pkgname}-${pkgver}-${pkgbuild}
pkgrel=1
pkgdesc="Finally, an MMORPG that's all about grinding and doing chores"
arch=('i686' 'x86_64')
url="https://choria.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'sqlite' 'zlib')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgfullname}-src.tar.gz")
sha256sums=('2f3b34001fab669d7a58ae74a08c718d49cf99564b1be02ab93c163c472924c3')

build() {
	cd "$srcdir/$pkgfullname"
	cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_VERSION=OFF -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgfullname"
	make DESTDIR="$pkgdir/" install
}
