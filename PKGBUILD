# Maintainer: Craggles <craggles17@gmail.com>
# Source: https://www.virtualhere.com/client_service

pkgname=virtualhere-client
pkgver=1.0.2
pkgrel=1
pkgdesc="VirtualHere USB Client for Linux Desktop"
arch=("i686" "x86_64")
url="https://www.virtualhere.com/usb_server_software"
license=("BSD")
optdepends=("avahi: systemd unit support")
provides=("virtualhereclient")
conflicts=("virtualhereclient")
source=("https://www.virtualhere.com/sites/default/files/usbclient/scripts/virtualhereclient.service"
       "https://www.virtualhere.com/sites/default/files/usbclient/vhclientx86_64")
md5sums=('37d1c9ac1b1d9f4ecb99ea6f5b6af5dc'
	 '680e4bf4c0ab1b921dc2d4763b304ade'
	)

package() {
    install -Dm755 vhclientx86_64              "${pkgdir}/usr/bin/vhclientx86_64"
    install -Dm644 virtualhereclient.service "${pkgdir}/etc/systemd/system/virtualhereclient.service"
}
