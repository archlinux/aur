# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=corebird-without-video
pkgver=1.2
pkgrel=2
pkgdesc="Native GTK+ Twitter Client without the gstreamer dependencies."
arch=('i686' 'x86_64')
license=('GPL')
url="http://corebird.baedert.org/"
conflicts=("corebird" "corebird-git")
depends=('gtk3>=3.14'
    'glib2>=2.40'
    'rest>=0.7'
    'libgee>=0.8'
    'sqlite3'
    'libtool'
    'libsoup>=2.4'
    'json-glib'
    'intltool>=0.40'
    'librsvg')
makedepends=('vala>=0.28' 'automake')
source=("https://github.com/baedert/corebird/archive/${pkgver}.tar.gz")
sha1sums=('8f498b39ba920bd1fb42dac90ced600c5a6e50a5')
install=corebird.install

build() {
    cd "corebird-${pkgver}"
    ./autogen.sh --prefix=/usr --disable-video
    make
}

package() {
    cd "corebird-${pkgver}"
    make DESTDIR=${pkgdir} install
}
