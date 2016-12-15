# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Vasil Yonkov < bustervill at fastmail dot fm >
#
# This is the Debian package build of bs1770gain. It has a rewritten
# build system, made to use autotools and not download arbitrary stuff
# from the internet.
#
# This source is maintained under the umbrella of Debian Multimedia.

pkgname=bs1770gain
pkgver=0.4.12
pkgrel=1
pkgdesc='A loudness scanner compliant with ITU-R BS.1770.'
arch=('x86_64')
url="http://${pkgname}.sourceforge.net"
license=('GPL2')
depends=('ffmpeg' 'sox')
source=("http://http.debian.net/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
# From the verified .dsc file, but apparently makepkg doesn’t support checking such files currently.
sha256sums=('cafc5440cf4940939c675e98c8dbeb839f4965d60f74270a37d4ee70559b3a59')

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
}
