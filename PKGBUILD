# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Asa Marco <marcoasa90[at]gmail[dot]com>
#
pkgname="imagination"
pkgver="3.5"
pkgrel="1"
pkgdesc="Imagination is a lightweight and simple DVD slideshow maker in GTK+2."
arch=('i686' 'x86_64')
url="http://imagination.sourceforge.net/"
license=('GPL')
depends=('gtk3' 'ffmpeg' 'sox')
makedepends=('intltool' 'docbook-xsl' 'libxslt')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('6cf1621b7bbb1a21b8a845a7250dcaf3281734c3ce0e0ff146cf5f323d00f100')

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
