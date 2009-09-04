# Contributor: Slash <demodevil5 [AT] yahoo [DOT] com>

pkgname=gmameui
pkgver=0.2.11
pkgrel=1
pkgdesc='SDLMAME/XMAME frontend designed to look like MAME32 (fork of GXMAME)'
arch=('i686' 'x86_64')
url='http://gmameui.sourceforge.net/'
license=('GPL')
depends=('gnome-doc-utils' 'libarchive' 'libglade')
makedepends=('intltool')
source=("http://downloads.sourceforge.net/sourceforge/gmameui/$pkgname-$pkgver.tar.gz")
md5sums=('06c3b2fd51ee6fa0c0f36881168102c7')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr --disable-libgnome --enable-joystick
    make || return 1
    make DESTDIR="$pkgdir" install
}

