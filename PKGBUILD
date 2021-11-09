# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=concordium-desktop-wallet-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Desktop wallet for Concordium blockchain'
arch=('x86_64')
url='https://concordium.com/'
license=('unknown')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
optional=('libappindicator-gtk3')
source=("https://distribution.mainnet.concordium.software/tools/linux/concordium-desktop-wallet-$pkgver.deb")
sha512sums=('a8c2400b8cd4931b29091a78ca1db85d7498c4d7d7c8006999a3ae090262871300a983b25e88d9aefc87146fd297217b0aca9a0b3570643fef76e94015a33ab0')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Concordium Wallet/concordium-desktop-wallet' "$pkgdir/usr/bin"
}
