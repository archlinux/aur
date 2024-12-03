# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=systemd-shorter-shutdown-timer
pkgver=1
pkgrel=1
pkgdesc="Reduce systemd shutdown timeouts to 45s as in Fedora"
url="https://fedoraproject.org/wiki/Changes/Shorter_Shutdown_Timer"
arch=('any')
license=('0BSD')
depends=('systemd')
source=(10-timeout-fast-and-abort.conf)
sha256sums=('d27a85f277a58c3c3fdb4d6a470c54cbbfd9cbe7d8914d9b7a26f1719894da42')

package() {
  install -Dpm644 -t "${pkgdir}/usr/lib/systemd/system/service.d/" 10-timeout-fast-and-abort.conf
  install -Dpm644 -t "${pkgdir}/usr/lib/systemd/user/service.d/" 10-timeout-fast-and-abort.conf
}
