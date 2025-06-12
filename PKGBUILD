# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=dynamic-power-daemon
pkgver=3.2.1
pkgrel=1
pkgdesc="Auto-switches powerprofilesctl/asusctl profiles by CPU load & workload"
arch=('any')
url="https://github.com/evertvorster/dynamic-power-daemon"
license=('GPL3')
depends=('bc' 'systemd')       # bc needed for float math; systemd for service
source=("https://github.com/evertvorster/dynamic-power-daemon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
install="${pkgname}.install"   # <- hook lives here

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # scripts
  install -Dm755 dynamic_power.sh          "${pkgdir}/usr/bin/dynamic_power.sh"
  install -Dm755 dynamic_power_monitor.sh  "${pkgdir}/usr/bin/dynamic_power_monitor.sh"

  # service
  install -Dm644 dynamic-power.service     "${pkgdir}/usr/lib/systemd/system/dynamic-power.service"
}
