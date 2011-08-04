# Contributor: Slash <demodevil5 [AT] yahoo [DOT] com>

pkgname=gmameui
pkgver=0.2.12
pkgrel=1
pkgdesc='SDLMAME/XMAME frontend designed to look like MAME32 (fork of GXMAME)'
arch=('i686' 'x86_64')
url='http://gmameui.sourceforge.net/'
license=('GPL')
depends=('gnome-doc-utils' 'libarchive' 'libglade' 'vte')
makedepends=('intltool')
source=("http://sourceforge.net/projects/gmameui/files/gmameui/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('e1f36731b0007501cf4c169aaee2ccc8')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr --disable-libgnome --enable-joystick
    make
    make DESTDIR="$pkgdir" install
}
