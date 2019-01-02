# Maintainer: Michal Lisowski <lisu@riseup.net>

pkgname=bitmask
pkgver=0.10.2
pkgrel=4
pkgdesc="easy and secure encrypted communication"
arch=('x86_64')
url="https://bitmask.net/"
license=('GPL3')
groups=('base-devel')
source=(https://dl.bitmask.net/client/linux/stable/Bitmask-linux64-latest.tar.gz bitmask.desktop)
md5sums=(94bb24e9068d9ca71ced7469aa18a43d 0d109e95a7dd38f64f95b48afc9f6d18)
makedepends=(wget)

package() {
	mkdir -p "${pkgdir}/usr/share/applications/"
	mkdir "${pkgdir}/opt/"
	cp bitmask.desktop "${pkgdir}/usr/share/applications/"
	tar -zxf Bitmask-linux64-latest.tar.gz -C "${pkgdir}/opt/"
	cp -r "${pkgdir}/opt/bitmask-0.10.2" "${pkgdir}/opt/bitmask"
	wget -O "${pkgdir}/opt/bitmask/icon.png" https://bitmask.readthedocs.io/en/latest/_static/bitmask-sidebar.png
}
