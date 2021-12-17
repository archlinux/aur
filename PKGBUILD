# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=concordium-desktop-wallet-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Desktop wallet for Concordium blockchain'
arch=('x86_64')
url='https://concordium.com/'
license=('unknown')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
optional=('libappindicator-gtk3')
source=("https://distribution.mainnet.concordium.software/tools/linux/concordium-desktop-wallet-$pkgver.deb")
sha512sums=('321a18abbe7c8e6f2834d92e9be60d67aae6a26035d96712fa86839bb2babfb37f53232c98f77a0586cc7057f6e26dd1768162da7a63b3452d7ef8204f8cc260')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Concordium Wallet/concordium-desktop-wallet' "$pkgdir/usr/bin"
}
