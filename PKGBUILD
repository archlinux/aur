# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
pkgname=jmtpfs
pkgver=0.5
pkgrel=1
license=('GPL3')
pkgdesc="mtpfs with better support for Android"
arch=('i686' 'x86_64')
url="http://research.jacquette.com/jmtpfs-exchanging-files-between-android-devices-and-linux/"
depends=('fuse' 'libmtp')
source=("https://github.com/JasonFerrara/jmtpfs/archive/v${pkgver}.tar.gz")
sha256sums=('c0cacc4751c586a3b2b0fcd9c98dae4810a5d44f3eb9d2870868a15eeb696883')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure CXXFLAGS=-lpthread --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
