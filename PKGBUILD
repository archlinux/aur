_pkgbase="huawei-wmi"
pkgname="${_pkgbase}-dkms"
pkgver=3.2
pkgrel=1
pkgdesc="Huawei WMI laptop extras driver"
url="https://github.com/aymanbagabas/Huawei-WMI"
arch=("x86_64")
license=("GPLv2")
depends=("dkms")
makedepends=("linux-headers")
zipname="huawei-wmi-dkms-${pkgver}"
source=("https://github.com/aymanbagabas/Huawei-WMI/releases/download/v${pkgver}/${zipname}.zip")
sha256sums=("80dcb00e978d851336fcd2acae294e1da92eb6342b98d75d6017b826a50647eb")

package() {
	cd "${_pkgbase}-${pkgver}"
	mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
	install -Dm644 Makefile huawei-wmi.c dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
