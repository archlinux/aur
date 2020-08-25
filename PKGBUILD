# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=iwd-autocaptiveauth-git
pkgver=0.1
pkgrel=1
pkgdesc='Automatically authenticate to captive portals, supports iwd'
arch=('x86_64')
url='https://git.project-insanity.org/onny/py-iwd-autocaptiveauth'
license=('MIT')
depends=('python' 'iwd' 'hyperpotamus' 'python-dbus' 'python-gobject')
source=("git+https://git.project-insanity.org/onny/py-iwd-autocaptiveauth.git"
	"iwd-autocaptiveauth.service"
	"iwd-autocaptiveauth.sysusers")
sha512sums=('SKIP'
            'dabd1b0341e8037ae579f701a50eb06159b01d6865d3d1925514566fba4aaa1fc6a46f6f24ede7c7cf856f9b2b9d6f9340de530eac6be6be876fc46037981ac4'
            'b7010111ebc6eac6fb721c6465876f52f7218fe52b85f13a475ba2783cd1d455e12f11c3b26b220415b5c6fb597e0fd276dfaa65a9d203f72b988fb2f035c979')

package() {
  cd "${srcdir}/py-iwd-autocaptiveauth"

  install -Dm 0755 iwd-autocaptiveauth.py "${pkgdir}/usr/lib/iwd-autocaptiveauth/iwd-autocaptiveauth"
  cp -r profiles "${pkgdir}/usr/lib/iwd-autocaptiveauth/"

  install -Dm 0644 "${srcdir}/iwd-autocaptiveauth.service" "$pkgdir/usr/lib/systemd/system/iwd-autocaptiveauth.service"
  install -Dm 0644 "${srcdir}/iwd-autocaptiveauth.sysusers" "${pkgdir}/usr/lib/sysusers.d/iwd-autocaptiveauth.conf"
}
