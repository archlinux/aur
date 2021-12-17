# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=concordium-desktop-wallet-testnet-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Desktop wallet for Concordium blockchain in testnet'
arch=('x86_64')
url='https://developer.concordium.software/en/testnet/net/index.html'
license=('unknown')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
optional=('libappindicator-gtk3')
source=("https://distribution.testnet.concordium.com/tools/linux/concordium-desktop-wallet-testnet-$pkgver.deb")
sha512sums=('9c0156d59288a3f7768602fc6fdf60086e554df5d840f7331954f94b7edaeb50c5608aeae2908301f6cfe0de48ae3f1eeb6423bd4933285142f287da779fb3be')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Concordium Wallet testnet/concordium-desktop-wallet-testnet' "$pkgdir/usr/bin"
}
