# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Vasil Yonkov < bustervill at fastmail dot fm >

pkgname=bs1770gain
pkgver=0.4.12
pkgrel=1
pkgdesc='A loudness scanner compliant with ITU-R BS.1770.'
arch=('x86_64')
url="http://${pkgname}.sourceforge.net"
license=('GPL')
depends=('ffmpeg' 'sox')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
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
