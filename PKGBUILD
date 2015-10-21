# Maintainer: TingPing <tingping@tingping.se>

pkgname=retro-gobject
pkgver=0.4
pkgrel=1
pkgdesc='A GObject based Libretro wrapper for frontends'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/Kekun/retro-gobject'
depends=('glib2')
makedepends=('intltool' 'libtool' 'gobject-introspection')
source=("https://github.com/Kekun/retro-gobject/releases/download/${pkgver}/retro-gobject-${pkgver}.tar.gz")
sha256sums=('0f5f1abbe63f17537f8d07061150680dbe169e703a8e0701a248a6006909f0ec')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr --enable-introspection
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir" make install
}
