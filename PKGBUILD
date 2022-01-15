# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=concordium-desktop-wallet-testnet-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Desktop wallet for Concordium blockchain in testnet'
arch=('x86_64')
url='https://developer.concordium.software/en/testnet/net/index.html'
license=('unknown')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
optional=('libappindicator-gtk3')
source=("https://distribution.testnet.concordium.com/tools/linux/concordium-desktop-wallet-testnet-$pkgver.deb")
sha512sums=('d27cdc2b3f0d88cef30437334588c1c8c05b3cd3eb6ed8ab953b5c86c33cbb9e2368e8a4bf945f0986dc47885cf8f85572eb283de5422090b0662d21d96b3116')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Concordium Wallet testnet/concordium-desktop-wallet-testnet' "$pkgdir/usr/bin"
}
