# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

pkgname=prepare-lastboot
pkgver=1.2
pkgrel=1
pkgdesc='Support for ZFS fallback to a previous boot'
arch=(any)
license=(GPL3)
url='https://kent-dobias.com/system/prepare-lastboot'
depends=('zfs' 'zfs-utils')
makedepends=()
optdepends=('systemd-ukify: create addon efi executable')
source=(https://git.kent-dobias.com/system/prepare-lastboot/snapshot/prepare-lastboot-${pkgver}.tar.gz)
sha256sums=('d6282aabcaf7e19feee5a7ec9348625795428edf7c15d216f3619b3377743ac0')
install='prepare-lastboot.install'

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 "prepare-lastboot@.service" "${pkgdir}/usr/lib/systemd/system/prepare-lastboot@.service"
  install -Dm 644 "prepare-lastboot@.timer" "${pkgdir}/usr/lib/systemd/system/prepare-lastboot@.timer"
  install -Dm 755 "prepare-lastboot" "${pkgdir}/usr/bin/prepare-lastboot"
}
