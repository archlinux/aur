# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=corebird-without-video
pkgver=1.4
pkgrel=2
pkgdesc="Native GTK+ Twitter Client without the gstreamer dependencies."
arch=('i686' 'x86_64')
license=('GPL')
url="http://corebird.baedert.org/"
conflicts=("corebird" "corebird-git")
depends=('gtk3>=3.18'
    'glib2>=2.40'
    'rest>=0.7'
    'sqlite3'
    'libtool'
    'libsoup>=2.4'
    'json-glib'
    'intltool>=0.40'
    'gspell'
    'librsvg')
makedepends=('vala>=0.28' 'automake')
source=("https://github.com/baedert/corebird/archive/${pkgver}.tar.gz")
sha1sums=('c30f95ad8c246e0885511b4e983270d59644c5cb')

build() {
    cd "corebird-${pkgver}"
    ./autogen.sh --prefix=/usr --disable-video
    make
}

package() {
    cd "corebird-${pkgver}"
    make DESTDIR=${pkgdir} install
}
