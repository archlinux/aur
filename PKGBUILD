# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=concordium-desktop-wallet-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Desktop wallet for Concordium blockchain'
arch=('x86_64')
url='https://concordium.com/'
license=('unknown')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
optional=('libappindicator-gtk3')
source=("https://distribution.mainnet.concordium.software/tools/linux/concordium-desktop-wallet-$pkgver.deb")
sha512sums=('6adb31d0b32ddc537f01338dba77dfc38f4b081399d22e4b2bbf09e949990cb14f5c0dc96c8c0a28c689aefcf85dbc08456b94aff7095eff8db47c099f2b88b2')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Concordium Wallet/concordium-desktop-wallet' "$pkgdir/usr/bin"
}
