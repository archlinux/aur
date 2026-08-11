# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=tapps2
pkgver=1.25
_pkgname=tapps2-$pkgver
pkgrel=1
pkgdesc="A vector-based drawing program which was developed for planning and programming of
the UVR1611 and UVR16x2 controllers, the RSM610 control module, CAN-I/O45 and CAN-EZ2."
arch=("x86_64" "i386")
url="https://www.ta.co.at"
license=('Unknown')
depends=('gtk2')
makedepends=(rpm-tools cpio)
options=('!strip')
install="tapps2.install"
source_x86_64=("$_pkgname-x86_64.rpm::$url/fileadmin/Downloads/Software/TAPPS2/Linux/64bit/$_pkgname-x86_64.rpm")
sha256sums_x86_64=('a548c8a72d8b20db981af81c15cb34918788006baa4bf72a04a7c83213530e21')
source_i386=("$_pkgname-i386.rpm::$url/fileadmin/Downloads/Software/TAPPS2/Linux/32bit/$_pkgname-i386.rpm")
sha256sums_i386=('677b9b5586c11e83001830b1347eb393524f7ed767b1454d3641b9521546cc69')

package() {
  rpm2cpio tapps2-$pkgver-$CARCH.rpm | cpio -idmv -D $pkgdir/
}
