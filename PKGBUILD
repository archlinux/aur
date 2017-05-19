# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Contributor: Jan Kroulik <jk at wo dot cz>

pkgname=cups-xerox-workcentre-3025
pkgver=1.0_25
pkgrel=1
pkgdesc="Xerox WorkCentre 3025 printer driver for CUPS."
arch=(i686 x86_64)
url="http://www.support.xerox.com/support/workcentre-3025"
source=("http://download.support.xerox.com/pub/drivers/WC3025/drivers/linux/en_GB/Xerox_WorkCentre_3025_Linux-Driver.tar.gz")

license=('custom')
sha256sums=('845e56dae3a2ed37064ad88e6b51a09ec90bdcd1c227c11ef4c2d121da3ddcc2')

makedepends=('binutils' 'tar')
depends_i686=('libcups')

package() {
    cd ${srcdir}
    mkdir -p "$pkgdir/usr/share/ppd/xerox/"
    find -name '*.ppd' -execdir install -Dm644 {} "$pkgdir/usr/share/ppd/xerox/" \;
}
