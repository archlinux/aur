# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=btrfsmaintenance
pkgver=0.2
pkgrel=1
pkgdesc='btrfs maintenance scripts'
arch=('any')
url='https://github.com/kdave/btrfsmaintenance'
license=('GPL2')
depends=('bash')
conflicts=("${pkgname}-git")
source=("https://github.com/kdave/btrfsmaintenance/archive/v${pkgver}.tar.gz")
sha256sums=('fc9a7f380bafa78981e7d524adb89d3f054dde2d1b133eb1a3212b2c3032be28')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm 0755 "${pkgdir}/usr/share/btrfsmaintenance"
  install -dm 0755 "${pkgdir}/usr/lib/systemd/system"

  install -m 0755 btrfs-balance.sh "${pkgdir}/usr/share/btrfsmaintenance/btrfs-balance.sh"
  install -m 0755 btrfs-defrag.sh "${pkgdir}/usr/share/btrfsmaintenance/btrfs-defrag.sh"
  install -m 0755 btrfs-scrub.sh "${pkgdir}/usr/share/btrfsmaintenance/btrfs-scrub.sh"
  install -m 0755 btrfs-trim.sh "${pkgdir}/usr/share/btrfsmaintenance/btrfs-trim.sh"
  install -m 0755 btrfsmaintenance-refresh-cron.sh "${pkgdir}/usr/share/btrfsmaintenance/btrfsmaintenance-refresh-cron.sh"
  install -m 0644 README.md "${pkgdir}/usr/share/btrfsmaintenance/README.md"
  install -m 0644 btrfsmaintenance-refresh.service "${pkgdir}/usr/lib/systemd/system/btrfsmaintenance-refresh.service"
}

# vim:set ts=2 sw=2 et:
