# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>

# Purpose of this package: to automate some steps covered in the ArchWiki.

pkgname=vmware-systemd-services
pkgver=0.1
pkgrel=1
pkgdesc="A collection of systemd services to interface with VMWare /etc/init.d scripts."
arch=('any')
url="https://wiki.archlinux.org/index.php/VMware"
license=('ISC')
groups=('vmware')
depends=('systemd')
source=('vmware.service'
		'vmware-USBArbitrator.service')
md5sums=('0f540eca927f18646646eb32c3c23951'
         '876c623915264a82420737a50a76919f')

package() {
	cd "$srcdir"

	_systemdbasedir="$pkgdir/usr/lib/systemd/system"

	for file in *.service
	do
		install -Dm644 $file "$_systemdbasedir/$file"
	done
}
