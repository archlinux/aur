# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) < bustervill at fastmail dot fm >
# Contributor: Vasil Yonkov < bustervill at fastmail dot fm >
#
# This is the Debian package build of bs1770gain. It has a rewritten
# build system, made to use autotools and not download arbitrary stuff
# from the internet.
#
# This source is maintained under the umbrella of Debian Multimedia.

pkgname=bs1770gain
pkgver=0.4.11
pkgrel=1
pkgdesc='A loudness scanner compliant with ITU-R BS.1770.'
arch=('x86_64')
url="http://${pkgname}.sourceforge.net"
license=('GPL2')
depends=('ffmpeg' 'sox')
source=("http://http.debian.net/debian/pool/main/b/bs1770gain/${pkgname}_${pkgver}.orig.tar.gz")
sha512sums=('74fcd1fdb36a2999ae3bada3dc4c30a3acb9c9ceb46281751cf65e489bcafbcaae3f03894ea7f1d1333f936b06ee6181f5b81d8018a8f1749629f2ea16000897')

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}/" install
}
