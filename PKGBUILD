# Maintainer: Ossian Winter <ossian@winter.vg>
pkgname=gnome-shell-extension-s76-scheduler
_uuid=s76-scheduler@winter.vg
pkgver=0.3.1
pkgrel=1
pkgdesc='Tiny GNOME extension that updates process priorities using the System76 Scheduler'
arch=('x86_64')
url='https://github.com/ossianwinter/s76-scheduler'
license=('MPL-2.0')
depends=('gnome-shell' 'system76-scheduler')
makedepends=('git')
source=("git+https://github.com/ossianwinter/s76-scheduler.git#tag=v${pkgver}")
sha256sums=('07ddcbc7464bde5f30d707f57c54d87813ddf5d6ef2836c40449942182a01950')

package() {
  cd "${srcdir}/s76-scheduler"

  install --directory --mode=755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  cp --archive extension.js LICENSE metadata.json "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}
