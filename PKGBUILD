# Maintainer: Martin Brodbeck <martin at brodbeck-online dot de>
pkgname=cloudshell2-fan
pkgver=1.1.1
pkgrel=2
pkgdesc="scipt and systemd service for CloudShell2 to turn fan on/off"
arch=('armv7h')
url="https://www.rustysoft.de/?02_cloudshell2-fan"
license=('GPL3')
depends=('i2c-tools' 'python' 'python-systemd' 'smartmontools')
source=(https://github.com/beedaddy/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('f3236fdffcf519f3529c018541b4fb5b8847a62dffb8a0a3e9e2778bb3e9c0f7')

package() {
  cd $pkgname-$pkgver
  install -D -m755 "cloudshell2-fan.py" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "cloudshell2-fan.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
