_pkgbase="huawei-wmi"
pkgname="${_pkgbase}-dkms"
pkgver=3.4
pkgrel=1
pkgdesc="Huawei WMI laptop extras driver"
url="https://github.com/aymanbagabas/Huawei-WMI"
arch=("x86_64")
license=("GPLv2")
depends=("dkms")
makedepends=("linux-headers")
zipname="huawei-wmi-dkms-${pkgver}"
source=("https://github.com/aymanbagabas/Huawei-WMI/releases/download/v${pkgver}/${zipname}.zip")
sha256sums=("bac8fe1ead3d56be478b7588a32a8ae7dd698840533cb1b645ab90ddcaf4b72c")

package() {
	cd "${_pkgbase}-${pkgver}"
	mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
	install -Dm644 Makefile huawei-wmi.c dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
