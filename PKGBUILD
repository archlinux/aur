# Maintainer: Fredrik Storm <fredrik@fldc.se>
pkgname=nuphyctl-bin
pkgver=0.7.0
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
# Source commit: 64f0dd5267dd3a3da1bae486753609a23d39f832
# Build: https://github.com/fldc/nuphyctl/actions/runs/42907310495
# Bundles and verification instructions: https://github.com/fldc/nuphyctl/releases/tag/v0.7.0
source_x86_64=(
    "$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/fldc/nuphyctl/releases/download/v$pkgver/nuphyctl-v$pkgver-linux-x86_64.tar.gz"
)
source_aarch64=(
    "$pkgname-$pkgver-linux-aarch64.tar.gz::https://github.com/fldc/nuphyctl/releases/download/v$pkgver/nuphyctl-v$pkgver-linux-aarch64.tar.gz"
)

package() {
    install -Dm755 nuphyctl "$pkgdir/usr/bin/nuphyctl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -R THIRD-PARTY-NOTICES "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 70-nuphyctl.rules "$pkgdir/usr/lib/udev/rules.d/70-nuphyctl.rules"
}
sha256sums_x86_64=('1cb4d05a0faf359531fd96d01c5a114dead3cc2d640437195db3a4a18fb1fd88')
sha256sums_aarch64=('5a71edf2a6060edb0a351e4feeaf4f49535e79cf181ac1ddd7d094d021c15086')
