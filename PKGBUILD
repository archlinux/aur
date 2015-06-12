# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=gvolwheel
pkgver=1.0
pkgrel=1
pkgdesc="a lightweight audio mixer which lets you control the audio volume through a tray icon"
url="http://sourceforge.net/projects/gvolwheel/"
arch=('i686' 'x86_64')
license=('GPL-2')
makedepends=('perlxml')
depends=('gtk3')
makedepends=('intltool')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('4f04f00cdb875894c96b8a3ff8a9edb9')

build() {
cd $srcdir/${pkgname}-$pkgver
./configure --prefix=/usr --docdir=/usr/share/doc/gvolwheel
# setting docdir is ineffective
sed -i '/gvolwheeldocdir/s/doc\//share\/doc\//' Makefile
make
}

package() {
cd $srcdir/${pkgname}-$pkgver
make DESTDIR=${pkgdir} install
}
