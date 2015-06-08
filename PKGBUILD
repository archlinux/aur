# Maintainer: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Todd Partridge <toddrpartridge@gmail.com>

pkgname=dell2150-cups-driver
pkgver=1.0
pkgrel=1
pkgdesc='Proprietary driver for Dell 2150cd, 2150cdn printers'
arch=(x86_64)
url='http://www.dell.com'
license=(proprietary)
depends=(lib32-libcups cups)
makedepends=(rpmextract)
_zip="05_2150_SFP_Linux.zip"
_rpm="Dell-2150-Color-Printer-${pkgver}-${pkgrel}.i686.rpm"
source=("http://downloads.dell.com/FOLDER00409836M/1/$_zip")
md5sums=(30c54189a1832fc8caec89c04fad100b)
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
