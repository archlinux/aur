# Maintainer: Jeffrey Clark (h0tw1r3) <dude@zaplabs.com>
# Inspiration: dell2150-cups-driver

pkgname=dell2155-cups-driver
pkgver=1.0
pkgrel=1
pkgdesc='Proprietary driver for Dell 2155cd, 2155cdn printers'
arch=('i686' 'x86_64')
url='http://www.dell.com'
license=('proprietary')
depends=('cups')
depends_x86_64=('lib32-libcups')
makedepends=('rpmextract')
_zip="06_2155_Driver_Linux.zip"
_rpm="Dell-2155-Color-MFP-${pkgver}-${pkgrel}.i686.rpm"
source=("http://downloads.dell.com/FOLDER00411421M/1/$_zip")
sha1sums=('16c9682556d2f621c10a4e80b0b849661cdb1faf')
options=(!strip)

prepare()
{
    mkdir "$srcdir/rpm"
    cd "$srcdir/rpm"
    rpmextract.sh "../Linux/$_rpm"
}

package()
{
    cd "$srcdir"

    cp -r rpm/* "$pkgdir"/
}

# vim:et:sw=4:sts=4
