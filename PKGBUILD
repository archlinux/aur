# Maintainer: Wali Lambert <wali.lambert1960@gmail.com>
pkgname=tlp-battery-tuner
pkgver=1.0.0
pkgrel=1
pkgdesc="Battery-focused TLP tuning config (turbo, PCIe ASPM, USB/SATA/audio power save, WiFi power save)"
arch=('any')
url="https://github.com/YatoVoid/tlp-battery-tuner"
license=('MIT')
depends=('tlp')
backup=("etc/tlp.d/00-battery-tuner.conf")
source=("$pkgname-$pkgver.tar.gz::https://github.com/YatoVoid/tlp-battery-tuner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43b0711f9efa0014754e69cbd4e10bf36abbecef5d8cc36d71410588c255e24d')
install=tlp-battery-tuner.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 tlp.d/00-battery-tuner.conf "$pkgdir/etc/tlp.d/00-battery-tuner.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
