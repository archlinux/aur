# Maintainer: gCurse <gcurse at web dot de>

pkgname=gstreamer0.10-gnonlin
_pkgname=gnonlin
pkgver=0.10.17
pkgrel=2
pkgdesc="A library for creating non-linear video editors"
arch=('x86_64' 'i686')
url="http://gstreamer.freedesktop.org/"
license=('GPL2')
depends=('gstreamer0.10')
makedepends=('automake' 'autoconf' 'intltool' 'gstreamer0.10-base' 'gstreamer0.10-base-plugins' )
source=(https://gstreamer.freedesktop.org/src/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('93c46ba292139b28a126852a49c6c562dc43da6e5cc2ae2f144e9bb7e5d2bde6')

build() {
    cd ${_pkgname}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --disable-gtk-doc
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
}
