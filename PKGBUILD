# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=concordium-desktop-wallet-testnet-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Desktop wallet for Concordium blockchain in testnet'
arch=('x86_64')
url='https://developer.concordium.software/en/testnet/net/index.html'
license=('unknown')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
optional=('libappindicator-gtk3')
source=("https://distribution.testnet.concordium.com/tools/linux/concordium-desktop-wallet-testnet-$pkgver.deb")
sha512sums=('7d9b582ffaf9a14739803b1ef9167e6dfc416d64204850d0f79b6f960956580573a6509e3e3449d4cbf2529962fd45656e88791402f3299f546a4722e81cf3cc')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Concordium Wallet testnet/concordium-desktop-wallet-testnet' "$pkgdir/usr/bin"
}
