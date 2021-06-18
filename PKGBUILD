# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=concordium-desktop-wallet-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Desktop wallet for Concordium blockchain'
arch=('x86_64')
url='https://concordium.com/'
license=('unknown')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
optional=('libappindicator-gtk3')
source=("https://distribution.mainnet.concordium.software/tools/linux/concordium-desktop-wallet-$pkgver.deb")
sha512sums=('50f7112cae1cca3748c4b2e925c652483e4306730ae3cce3f09cd29ac2f79a91c421c2d30ff9b497e93453691edc68c800d3a3b2b6af50335d3d4710b4916c48')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/Concordium Wallet/concordium-desktop-wallet" "$pkgdir/usr/bin"
}
