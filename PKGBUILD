# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=systemd-shorter-shutdown-timer
pkgver=2
pkgrel=1
pkgdesc="Reduce systemd shutdown timeouts to 45s as in Fedora"
url="https://fedoraproject.org/wiki/Changes/Shorter_Shutdown_Timer"
arch=('any')
license=('0BSD')
depends=('systemd')
source=(10-timeout-abort.conf 10-default-timeout.conf)
sha256sums=('f211ca4d2573f46749599a29e064f53695ea2c5936ea7cb44c28b7ddbad41450'
            '1ef7c1ba2e87524d000aeaa7fa07dd5d69d28ed40366ebe9b3f6552322f24b17')

package() {
  install -Dpm644 -t "${pkgdir}/usr/lib/systemd/system/service.d/" 10-timeout-abort.conf
  install -Dpm644 -t "${pkgdir}/usr/lib/systemd/user/service.d/" 10-timeout-abort.conf
  install -Dpm644 -t "${pkgdir}/usr/lib/systemd/system.conf.d/" 10-default-timeout.conf
  install -Dpm644 -t "${pkgdir}/usr/lib/systemd/user.conf.d/" 10-default-timeout.conf
}
