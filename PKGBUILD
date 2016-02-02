# Maintainer: Ainola

pkgname=gnome-mpv
pkgver=0.7
pkgrel=3
pkgdesc="GNOME frontend for MPV"
arch=('i686' 'x86_64')
url="https://github.com/gnome-mpv/gnome-mpv"
license=('GPL3')
depends=('gtk3' 'mpv')
makedepends=('intltool' 'autoconf-archive' 'appstream-glib')
optdepends=('youtube-dl: Video integration to YouTube and other video sites.')
conflicts=('gnome-mpv-git')
source=("https://github.com/gnome-mpv/gnome-mpv/archive/v${pkgver}.tar.gz")
sha256sums=('75c48483bc80c94463153567ebb6a66ea2c6055f85f57faf853c9fc406eb6d7d')
install='gnome-mpv.install'

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
