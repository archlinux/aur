# Maintainer: Fredrik Storm <fredrik@fldc.se>
pkgname=nuphyctl-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Rust CLI for sending NuPhy keyboard HID commands"
arch=('x86_64' 'aarch64')
url="https://github.com/fldc/nuphyctl"
license=('MIT')
depends=('hidapi')
provides=('nuphyctl')
conflicts=('nuphyctl')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/fldc/nuphyctl/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/fldc/nuphyctl/releases/download/v$pkgver/nuphyctl-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-aarch64.tar.gz::https://github.com/fldc/nuphyctl/releases/download/v$pkgver/nuphyctl-v$pkgver-linux-aarch64.tar.gz")

package() {
    install -Dm755 nuphyctl "$pkgdir/usr/bin/nuphyctl"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 70-nuphyctl.rules "$pkgdir/usr/lib/udev/rules.d/70-nuphyctl.rules"
}
sha256sums=('f68933e05b2f9076808b495f9157ff473c98e07c584662e2a058cc7218d149cb')
sha256sums_x86_64=('564f3fd22958b7d42af771b7e5ac32c3b4e857f01d38fec3d10bd26fcdc281f4')
sha256sums_aarch64=('06924de1af283f27017bb78274e872ecb675d29ce2f8e20313e981b182c734bd')
