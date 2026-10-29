# Maintainer: Fredrik Storm <fredrik@fldc.se>
pkgname=nuphyctl-bin
pkgver=0.6.0
pkgrel=2
pkgdesc="Rust CLI for sending NuPhy keyboard HID commands"
arch=('x86_64' 'aarch64')
url="https://github.com/fldc/nuphyctl"
license=('MIT')
depends=('hidapi')
provides=('nuphyctl')
conflicts=('nuphyctl')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/fldc/nuphyctl/v$pkgver/LICENSE"
        '70-nuphyctl.rules')
source_x86_64=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/fldc/nuphyctl/releases/download/v$pkgver/nuphyctl-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-aarch64.tar.gz::https://github.com/fldc/nuphyctl/releases/download/v$pkgver/nuphyctl-v$pkgver-linux-aarch64.tar.gz")

package() {
    install -Dm755 nuphyctl "$pkgdir/usr/bin/nuphyctl"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 70-nuphyctl.rules "$pkgdir/usr/lib/udev/rules.d/70-nuphyctl.rules"
}
sha256sums=('f68933e05b2f9076808b495f9157ff473c98e07c584662e2a058cc7218d149cb'
            '216269fc850c8bcb360a84db364d434755ec161a5a24e7116fdf9978e6b17103')
sha256sums_x86_64=('24c2df140503c2018125fad772d84d2b2a4ddfab2e681d2f74d6918e8d17b7be')
sha256sums_aarch64=('0a2cf6150adc7da7dd571bd04a79f6b59104f46d2c2e4bb4e3a28c0b571d26cc')
