# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=nem-wallet
pkgver=2.3.2
pkgrel=1
pkgdesc="Nano Wallet"
arch=('i686' 'x86_64')
url="https://github.com/NemProject/NanoWallet"
license=('MIT')
options=('!strip')
source=(https://github.com/NemProject/NanoWallet/releases/download/$pkgver/NanoWallet-$pkgver-linux64.zip)
sha256sums=('8b58ba4304f6d087147ca63e9f197ba8ca1d8d44d6205c6e183aed1713830b02')

package() {
    install -dm755 $pkgdir/usr/bin
    install -dm755 $pkgdir/opt/$pkgname
    cp -dr --no-preserve=ownership $srcdir/NanoWallet-$pkgver-linux64/* $pkgdir/opt/$pkgname
    ln -sf /opt/nem-wallet/NanoWallet $pkgdir/usr/bin/nem-wallet
}
