# Maintainer: Christopher Burr <chrisburr73@googlemail.com>
pkgname=sharp-mx-283to503-ps
pkgver=1.3
pkgrel=1
pkgdesc="PPD files for Sharp PostScript Printers(MX-283 to MX-503)"
arch=('i686' 'x86_64')
url="http://www.sharp.com"
license=('GPL')
depends=('cups')
source=("http://www.sharp.co.uk/cps/rde/xbcr/documents/documents/drv/34_ppc/MXM-MXB_DRV_PS-Linux-ver13_GB.ps.tar.gz")
md5sums=('1a9202caf50e0e2cd5f5150e79582012')

package() {
  cd "$srcdir"
  tar -xvf "MXM-MXB_DRV_PS-Linux-ver13_GB.ps.tar.gz"
  cd "$srcdir/sharp-${pkgver}-mx283to503-ps/src"
  mkdir -p "$pkgdir/usr/share/cups/model/Sharp"
  tar -C $pkgdir/usr/share/cups/model/Sharp -xf ppd.tar
}
