# Maintainer: Ainola

pkgname=gnome-mpv
pkgver=0.6
pkgrel=1
pkgdesc="GNOME frontend for MPV"
arch=('i686' 'x86_64')
url="https://github.com/gnome-mpv/gnome-mpv"
license=('GPL3')
depends=('gtk3' 'mpv')
makedepends=('intltool')
conflicts=('gnome-mpv-git')
source=("https://github.com/gnome-mpv/gnome-mpv/archive/v${pkgver}.tar.gz")
sha256sums=('e1544c5b2055cc0a92af625b87f53422e05dbe39043c5d5b3d6db1a75e3435c0')
install=('gnome-mpv.install')

build() {
    cd "${pkgname}-${pkgver}"
    autoreconf -sfi
    intltoolize -c --automake
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
