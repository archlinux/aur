# Maintainer: Ainola

pkgname=gnome-mpv
pkgver=0.8
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
sha256sums=('d18cea34c452242e188df9c4e6dcad6b2e99dec1dea324a66ec27b422c6fe3f8')
install='gnome-mpv.install'

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
