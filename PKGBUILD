# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=epm
arch=('i686' 'x86_64')
pkgver=4.2
pkgrel=1
pkgdesc="ESP Package manager is a UNIX software and file packaging program"
license=('GPL-2')
url="http://www.epmhome.org"
source=("http://ftp.funet.fi/pub/mirrors/ftp.easysw.com/pub/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
md5sums=('3805b1377f910699c4914ef96b273943')
depends=('libxft' 'gcc-libs')

build() {
cd $srcdir/${pkgname}-$pkgver
./configure --prefix=/usr
make
}

package(){
cd $srcdir/${pkgname}-$pkgver
make exec_prefix=$pkgdir libdir=$pkgdir/usr/lib mandir=$pkgdir/usr/share/man docdir=$pkgdir/usr/share/doc install
}
