# Maintainer: Ossian Winter <ossian@winter.vg>
pkgname=gnome-shell-extension-s76-scheduler
_uuid=s76-scheduler@winter.vg
pkgver=0.3.0
pkgrel=1
pkgdesc='Tiny GNOME extension that updates process priorities using the System76 Scheduler'
arch=('x86_64')
url='https://github.com/ossianwinter/s76-scheduler'
license=('MPL-2.0')
depends=('gnome-shell' 'system76-scheduler')
makedepends=('git')
source=("git+https://github.com/ossianwinter/s76-scheduler.git#tag=v${pkgver}")
sha256sums=('d535826e66159db1216eb72a6d2ea26cd0d2e0af60507ad19fb537deabc3d192')

package() {
  cd "${srcdir}/s76-scheduler"

  install --directory --mode=755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  cp --archive extension.js LICENSE metadata.json "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}
