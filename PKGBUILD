# Maintainer: Oliver Tzeng<olivertzeng at proton dot me>, Sebastian Wiesner <sebastian@swsnr.de>

pkgname=systemd-even-shorter-shutdown-timer
pkgver=2
pkgrel=1
pkgdesc="Reduce systemd shutdown timeouts to 5s unlike Fedora's 45s or default's 90s. Advised to only be used on personal computers and especially not on servers to prevent SQL data corruption"
url="https://fedoraproject.org/wiki/Changes/Shorter_Shutdown_Timer"
arch=('any')
license=('0BSD')
depends=('systemd')
source=(10-timeout-abort.conf 10-default-timeout.conf)
sha256sums=("SKIP)")

package() {
  install -Dpm644 -t "${pkgdir}/usr/lib/systemd/system/service.d/" 10-timeout-abort.conf
  install -Dpm644 -t "${pkgdir}/usr/lib/systemd/user/service.d/" 10-timeout-abort.conf
  install -Dpm644 -t "${pkgdir}/usr/lib/systemd/system.conf.d/" 10-default-timeout.conf
  install -Dpm644 -t "${pkgdir}/usr/lib/systemd/user.conf.d/" 10-default-timeout.conf
}
