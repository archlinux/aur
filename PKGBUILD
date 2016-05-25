# Maintainer: Ainola

pkgname=gnome-mpv
pkgver=0.9
pkgrel=1
pkgdesc="GNOME frontend for MPV"
arch=('i686' 'x86_64')
url="https://github.com/gnome-mpv/gnome-mpv"
license=('GPL3')
depends=('gtk3' 'mpv')
makedepends=('intltool')
optdepends=('youtube-dl: Video integration to YouTube and other video sites.')
conflicts=('gnome-mpv-git')
source=("https://github.com/gnome-mpv/gnome-mpv/releases/download/v${pkgver}/gnome-mpv-${pkgver}.tar.xz")
sha256sums=('c0363c2ea997562388a928bf8d1cd6a5bc3bfc3bd4576ad1ee6fcee10cedef1a')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
