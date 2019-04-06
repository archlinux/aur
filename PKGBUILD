# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor: Archie <xMickael@ifrance.com>
# Contributor: Byron Clark <byron@theclarkfamily.name>

_pkgname=pyexiv2
pkgname=python2-exiv2
pkgver=0.3.2
pkgrel=22
pkgdesc="Python binding to exiv2, the C++ library for manipulation of EXIF, IPTC and XMP image metadata."
url="http://launchpad.net/${_pkgname}"
arch=('x86_64')
depends=('python2' 'boost-libs' 'exiv2')
makedepends=('scons' 'boost')
replaces=('pyexiv2')
conflicts=('pyexiv2')
provides=('pyexiv2')
license=('GPL')
source=("http://launchpad.net/${_pkgname}/0.3.x/${pkgver}/+download/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('0abc117c6afa71f54266cb91979a5227f60361db1fcfdb68ae9615398d7a2127')

build() {
    cd ${_pkgname}-${pkgver}
    scons
}

package() {
    cd ${_pkgname}-${pkgver}
    scons DESTDIR="${pkgdir}" install
}
