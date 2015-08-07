# Maintainer: Ainola

pkgname=gnome-mpv
pkgver=0.5
pkgrel=1
pkgdesc="GNOME frontend for MPV"
arch=('i686' 'x86_64')
url="https://github.com/gnome-mpv/gnome-mpv"
license=('GPL3')
depends=('gtk3' 'mpv')
makedepends=('intltool')
conflicts=('gnome-mpv-git')
source=("https://github.com/gnome-mpv/gnome-mpv/archive/v${pkgver}.tar.gz")
sha256sums=('56064c16fb9a8b4e79cdd338800dd989588bed11574e4993a36308707e304cf3')
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
