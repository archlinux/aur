# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

pkgname=prepare-lastboot
pkgver=1.4
pkgrel=1
pkgdesc='Support for ZFS fallback to a previous boot'
arch=(any)
license=(GPL3)
url='https://kent-dobias.com/system/prepare-lastboot'
depends=('zfs' 'zfs-utils' 'binutils')
makedepends=()
optdepends=('systemd-ukify: create addon efi executable')
source=(https://git.kent-dobias.com/system/prepare-lastboot/snapshot/prepare-lastboot-${pkgver}.tar.gz)
sha256sums=('673a87988de6fb619dbfa2ac31c173b70195a9d200c8b3b2548ce7a4620be527')
install='prepare-lastboot.install'

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 "prepare-lastboot@.service" "${pkgdir}/usr/lib/systemd/system/prepare-lastboot@.service"
  install -Dm 644 "prepare-lastboot@.timer" "${pkgdir}/usr/lib/systemd/system/prepare-lastboot@.timer"
  install -Dm 755 "prepare-lastboot" "${pkgdir}/usr/bin/prepare-lastboot"
}
