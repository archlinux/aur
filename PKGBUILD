# Maintainer: Oliver Giles <web ohwg net>
pkgname=wemed
pkgver=0.4
pkgrel=1
pkgdesc="Multipart MIME (eml,mhtml,rf822) editor"
arch=('i686' 'x86_64')
url="http://wemed.ohwg.net"
license=('GPL3')
groups=()
depends=('gmime>=2.6' 'webkitgtk' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake')
options=('strip')
source=("https://github.com/ohwgiles/wemed/archive/v$pkgver.zip")
install=wemed.install
md5sums=('7f0236d93e8adc6bf83e53b810d54ccd')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make -j4
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

