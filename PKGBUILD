# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=xcursor-thedot
pkgver=0.3
pkgrel=1
pkgdesc="A mouse theme with circles"
arch=('any')
url="https://www.gnome-look.org/p/999763/"
license=('GPL')
depends=()
source=("https://dl.opendesktop.org/api/files/download/id/1464310837/174031-DOT_0.3.tar.gz"
	"thedot.patch")
md5sums=('283b367cbc93c3cad05fa044b8499248'
         'b482b06b978dd30b4fd2a8943cb3508a')

prepare() {
cd ${srcdir}/DOT_${pkgver}
patch -Np1 -i ../thedot.patch
}

package() {
cd ${srcdir}/DOT_${pkgver}
install -dm755 ${pkgdir}/usr/share/icons/
cp -vR {dark,light} ${pkgdir}/usr/share/icons/
}


