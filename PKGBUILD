# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=tpacpi-bat
pkgver=3.2
pkgrel=1
pkgdesc="A Perl script with ACPI calls for recent ThinkPads (such as T420 and W520) whose battery thresholds are not supported by tp_smapi"
url="https://github.com/teleshoes/tpacpi-bat"
arch=('any')
license=('GPL3')
depends=('perl' 'acpi_call')
backup=(etc/conf.d/tpacpi)
source=("$pkgname-$pkgver.tar.gz::https://github.com/teleshoes/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('bb4914c2491f7132c01ffa39320b4e1420eab72f7711cb428576d324d5e6b9645e222db077fd0a807e09edae10c64aff240b47b5e23eb9960dcf2ba42988d0fc')

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 examples/systemd_dynamic_threshold/tpacpi.service "$pkgdir"/usr/lib/systemd/system/tpacpi-bat.service
  install -Dm644 examples/systemd_dynamic_threshold/tpacpi.conf.d "$pkgdir"/etc/conf.d/tpacpi
}
