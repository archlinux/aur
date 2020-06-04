# Maintainer: nomisge <nomisge @ live . de>
pkgname=usbip-systemd
pkgver=1
pkgrel=1
pkgdesc="Systemd service files for usbip - remote host and local client"
arch=(any)
license=('GPL')
depends=('usbip')
backup=('etc/usbip/remote-devices/remote.conf'
    'etc/usbip/bind-devices/bind.conf')
source=("usbip-bind@.service"
        "usbip@.service"
        "remote.conf"
        "bind.conf")
sha256sums=('30f77b2bc666ec7360328aac2c7336dd77535dd9addf73083c672a7e20aaf2dc'
            '068c9680948e00997d78acd84eaccd78cf12c8bc332af9e10893679b9be61cc0'
            'bf5c1ab65307aaedc964ab4666bcfde0f031149b64e5c832730d684f630b25d8'
            'b7da25a1e649c1b18ff8736b355c2d5535038c9bfe85160b15ca5889f1bba67b')
package() {
	cd "${srcdir}"
        install -Dm644 "usbip-bind@.service" "${pkgdir}/usr/lib/systemd/system/usbip-bind@.service"
        install -Dm644 "usbip@.service" "${pkgdir}/usr/lib/systemd/system/usbip@.service"
        install -Dm644 "remote.conf" "${pkgdir}/etc/usbip/remote-devices/remote.conf"
        install -Dm644 "bind.conf" "${pkgdir}/etc/usbip/bind-devices/bind.conf"
}
