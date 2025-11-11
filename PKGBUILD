# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=mkinitcpio-sd-numlock
pkgver=1.0.0
pkgrel=1
pkgdesc="Enable numlock during early userspace using systemd"
arch=("any")
license=("GPL")
depends=("kbd")
source=(
	"sd-numlock"
	"initrd-numlock.service"
)
sha256sums=('b6674f6155519c1b33fe2bd0cb45dec47260b271a9c4e4fd14454281ed2c640a'
            'ee9ccc8abf397b3a2e950d9ad9f3279a09e19420d781aedcb396eee2871fc4f4')

package() {
	install -Dm644 "sd-numlock" "${pkgdir}/usr/lib/initcpio/install/sd-numlock"
	install -Dm644 "initrd-numlock.service" "${pkgdir}/usr/lib/systemd/system/initrd-numlock.service"
	install -d "${pkgdir}/usr/lib/systemd/system/initrd-root-fs.target.wants/"
	ln -s "/usr/lib/systemd/system/initrd-numlock.service" "${pkgdir}/usr/lib/systemd/system/initrd-root-fs.target.wants/initrd-numlock.service"
}
