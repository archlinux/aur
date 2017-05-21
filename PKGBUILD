# Maintainer: Vitor S Rodrigues <vitor.rodrigues@gmail.com>
pkgname=sharp-mx-182to232d-ps
pkgver=1.1
pkgrel=1
pkgdesc="PPD files for Sharp PostScript Printers(MX-182 to MX-232D)"
arch=('i686' 'x86_64')
url="http://www.sharp.co.uk/gb"
license=('GPL')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=("http://www.sharp.co.uk/cps/rde/xbcr/documents/documents/Service_Information/Drivers/sharp-1.1-sh-l01-ps.zip")
sha512sums=('bf2f338ab99caeb45ee77e5d95579d15dedf2c6892b275a7a928a32ddd4a03e45d36f764de85f5a835a7c7af3ff117155bd1ce4d823882f2534c32193013d5ac')

package() {
  cd "$srcdir"
  unzip "sharp-1.1-sh-l01-ps.zip"
  cd "$srcdir/sharp-${pkgver}-sh-l01-ps/src"
  mkdir -p "$pkgdir/usr/share/cups/model/Sharp"
  tar -C $pkgdir/usr/share/cups/model/Sharp -xf ppd.tar
}