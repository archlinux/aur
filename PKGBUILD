# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=concordium-desktop-wallet-bin
pkgver=1.1.5
pkgrel=1
pkgdesc='Desktop wallet for Concordium blockchain'
arch=('x86_64')
url='https://concordium.com/'
license=('unknown')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
optional=('libappindicator-gtk3')
source=("https://distribution.mainnet.concordium.software/tools/linux/concordium-desktop-wallet-$pkgver.deb")
sha512sums=('43dd962ea9e2ca8e8f7cbd01cb04e73578fcaa8141fd27fcbd4957a5718ece37ac5995b5a688fa1a0774f1d00bdeaf332ffbe256624856aeff836140126ea252')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Concordium Wallet/concordium-desktop-wallet' "$pkgdir/usr/bin"
}
