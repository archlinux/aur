# Maintainer: Oliver Giles <web ohwg net>
pkgname=wemed
pkgver=0.8
pkgrel=1
pkgdesc="Multipart MIME (eml,mhtml,rf822) editor"
arch=('i686' 'x86_64')
url="http://wemed.ohwg.net"
license=('GPL-3.0-only')
groups=()
depends=('gmime3' 'webkit2gtk-4.1' 'gtksourceview4' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake')
options=('strip')
source=("https://github.com/ohwgiles/wemed/archive/v$pkgver.tar.gz")
md5sums=('7a452125cc42270adf28dcad397b3d39')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make -j4
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

