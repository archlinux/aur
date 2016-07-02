# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xplayer-plparser
pkgver=1.0.2
pkgrel=2
pkgdesc="Playlist parser for xplayer. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmime' 'libsoup' 'libarchive' 'libquvi')
makedepends=('git' 'gnome-common' 'gtk-doc' 'gobject-introspection')
provides=($_pkgname)
conflicts=('xplayer-plparser-git')
url='https://github.com/linuxmint/xplayer-plparser'

source=("${pkgname}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('586fe3e544a4ebf0d450861ac65efb49')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./autogen.sh --prefix="/usr" \
         --localstatedir="/var" \
         --libexecdir="/usr/lib/${pkgname}"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

