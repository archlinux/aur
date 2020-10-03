# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Asa Marco <marcoasa90[at]gmail[dot]com>
#
pkgname="imagination"
pkgver="3.6"
pkgrel="1"
pkgdesc="Imagination is a lightweight and simple DVD slideshow maker in GTK+3."
arch=('i686' 'x86_64')
url="http://imagination.sourceforge.net/"
license=('GPL')
depends=('gtk3' 'ffmpeg' 'sox')
makedepends=('intltool' 'docbook-xsl' 'libxslt')
source=($pkgname-$pkgver.tar.gz::http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('85dfa14acfe78a8a721c86c0056ce6bd1b517e9b7e6ab9fb3a5864b7d37a2d8d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    #sed -i 's/PLUGINS_INSTALLED 0/PLUGINS_INSTALLED 1/g' src/support.h
    ./autogen.sh
    #LDFLAGS="-lm -lgmodule-2.0"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
