# Maintainer: Oliver Giles <web ohwg net>
pkgname=wemed
pkgver=0.7
pkgrel=1
pkgdesc="Multipart MIME (eml,mhtml,rf822) editor"
arch=('i686' 'x86_64')
url="http://wemed.ohwg.net"
license=('GPL3')
groups=()
depends=('gmime3' 'webkit2gtk' 'gtksourceview3' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake')
options=('strip')
source=("https://github.com/ohwgiles/wemed/archive/v$pkgver.tar.gz")
md5sums=('00ba5f79910039dcf36f59c114677b4b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make -j4
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

