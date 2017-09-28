# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=activrelay
pkgver=3.4.2
pkgrel=1
pkgdesc="Enables the use of Promethean hardware with ClassFlow"
arch=('i686' 'x86_64')
url="https://support.prometheanworld.com/product/activdriver"
license=('unknown')
depends=('qt4')

optdepends=('activinspire: activboard presentation')
source_x86_64=(http://activsoftware.co.uk/linux/repos/driver/ubuntu/pool/non-oss/a/activrelay/activrelay_${pkgver}-0~Ubuntu~1604_amd64.deb)
source_i686=(http://activsoftware.co.uk/linux/repos/driver/ubuntu/pool/non-oss/a/activrelay/activrelay_${pkgver}-0~Ubuntu~1604_i386.deb)
md5sums_x86_64=('8aea84ea603ea249719dd4c75fed5929')
md5sums_i686=('ed0b1f8f5163c2569aa29d829d117764')

package() {
	# extract archive
        bsdtar -C "$pkgdir" -xf data.tar.xz

        # move out of the local directory to match arch standards
        mv "$pkgdir"/usr/local/* "$pkgdir"/usr/
        rmdir "$pkgdir"/usr/local

        # delete the following line if you want an autostart of activrelay
        cd "$pkgdir"
	rm -r etc
}
