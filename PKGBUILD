pkgname=osdlyrics-pedrohlc
provides=osdlyrics
conflicts=(osdlyrics 'osdlyrics-git' 'osdlyrics-abiehaf')
pkgver=0.4.4
pkgrel=0
pkgdesc="A lyric show compatible with various media players + experimental ViewLyrics source + bug fixes"
arch=('i686' 'x86_64')
url="http://code.google.com/p/osd-lyrics/"
license=('GPL3')
depends=('gtk2' 'dbus-glib' 'curl' 'libnotify' 'libmpd' 'xmms2'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool')
install=$pkgname.install
source=("${provides}::git+git://github.com/PedroHLC/osdlyrics.git#branch=master")
md5sums=('SKIP')

build()
{
    cd "$srcdir/$provides"

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package()
{
    cd "$srcdir/$provides"
    make DESTDIR="$pkgdir" install
}