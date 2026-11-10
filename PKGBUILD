# Maintainer: Fredrik Storm <fredrik@fldc.se>
pkgname=nuphyctl-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Rust CLI for sending NuPhy keyboard HID commands"
arch=('x86_64' 'aarch64')
url="https://github.com/fldc/nuphyctl"
license=('MIT')
options=('!strip')
depends=('hidapi')
provides=('nuphyctl')
conflicts=('nuphyctl')
# Provenance verified for both archives and extracted executables.
# Source commit: 91b5b1359220ed9a7bebc1c336194825f824e4ba
# Build: https://github.com/fldc/nuphyctl/actions/runs/42832867490
# Bundles and verification instructions: https://github.com/fldc/nuphyctl/releases/tag/v0.6.2
source_x86_64=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/fldc/nuphyctl/releases/download/v$pkgver/nuphyctl-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-aarch64.tar.gz::https://github.com/fldc/nuphyctl/releases/download/v$pkgver/nuphyctl-v$pkgver-linux-aarch64.tar.gz")

package() {
    install -Dm755 nuphyctl "$pkgdir/usr/bin/nuphyctl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 70-nuphyctl.rules "$pkgdir/usr/lib/udev/rules.d/70-nuphyctl.rules"
}
sha256sums_x86_64=('8474df709fa279694e29117a9771d5a40dd07fc46eab880083c853690aecceff')
sha256sums_aarch64=('4207d427c49577336134d1d2d7fc8781246ba48f1e9261852831ff13f36d2dc0')
