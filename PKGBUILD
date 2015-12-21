# Maintainer: AJ <aj at hckr dot eml dot cc>
# Maintainer: Adam Kürthy  <adikurthy at gmail dot com>
# Maintainer: Michael Bentlage <Mi.Bentlage at gmail dot com>
pkgname=systemd-vgaswitcheroo-units
pkgver=1.3
pkgrel=1
pkgdesc="Disable discrete GPU at boot for AMD/NVIDIA & Intel dual stuff. This is based on the old AUR package that was not migrated to AUR4."
arch=('any')
# Based on https://github.com/fredoche/vgaswitcheroo_systemd
url="https://github.com/astrohckr/systemd-vgaswitcheroo-units"
license=('GPL')
depends=('systemd')
install=systemd-vgaswitcheroo-units.install
source=('vgaswitcheroo.service'
	    'vgaswitcheroo_start.sh'
	    'vgaswitcheroo_stop.sh'
	    'check_active_gpu.sh')
md5sums=('a01b63dacaa632b03cd2bfe1832f4d31'
         'f0305d6f4be6e2f3e3d8cf80b889b744'
         'fcbb48340873f67f4ad493a96ef951a4'
         '31363eacd067cd53a0571b2436600dcf')

package() {
  install -Dm644 "${srcdir}/vgaswitcheroo.service" "${pkgdir}/usr/lib/systemd/system/vgaswitcheroo.service"
  install -Dm755 "${srcdir}/vgaswitcheroo_start.sh" "${pkgdir}/usr/bin/vgaswitcheroo_start.sh"
  install -Dm755 "${srcdir}/vgaswitcheroo_stop.sh" "${pkgdir}/usr/bin/vgaswitcheroo_stop.sh"
  install -Dm755 "${srcdir}/check_active_gpu.sh" "${pkgdir}/usr/bin/check_active_gpu.sh"
}


