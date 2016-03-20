# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xplayer-plparser
pkgver=1.0.1
pkgrel=1
pkgdesc="Playlist parser for xplayer. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmime' 'libsoup' 'libarchive' 'libquvi')
makedepends=('git' 'gnome-common' 'gtk-doc' 'gobject-introspection')
provides=($_pkgname)
conflicts=('xplayer-plparser-git' $_pkgname)
url='https://github.com/linuxmint/xplayer-plparser'

source=("https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('779884f4cea5682d6f84d40eec983537')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./autogen.sh --prefix="/usr" \
         --localstatedir="/var" \
         --libexecdir="/usr/lib/xplayer-plparser"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

