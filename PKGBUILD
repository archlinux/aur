# Maintainer: gCurse <gcurse at web dot de>

pkgname=gstreamer0.10-gnonlin
pkgver=0.10.17
pkgrel=1
pkgdesc="A library for creating non-linear video editors"
arch=('x86_64' 'i686')
url="http://gstreamer.freedesktop.org/"
license=('GPL2')
depends=('gstreamer0.10')
makedepends=('automake' 'autoconf' 'intltool' 'gtk-doc' 'gstreamer0.10-base' 'gstreamer0.10-base-plugins' )
source=(http://gstreamer.freedesktop.org/src/gnonlin/gnonlin-0.10.17.tar.gz)
md5sums=('3f121bb2e6ae0b2bcb0b7301bd65e806')

_appname=gnonlin

build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_appname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
