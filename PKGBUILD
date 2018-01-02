# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=nem-wallet
pkgver=2.0.14
pkgrel=1
pkgdesc="Nano Wallet"
arch=('i686' 'x86_64')
url="https://github.com/NemProject/NanoWallet"
license=('MIT')
options=('!strip')
source=(https://github.com/NemProject/NanoWallet/releases/download/$pkgver/NanoWallet-$pkgver-linux64.zip)
sha256sums=('3c31222a9eb12f9f4394cec0dcc72a95211723f8b85e752b585048c1bdd05503')

package() {
    install -dm755 $pkgdir/usr/bin
    install -dm755 $pkgdir/opt/$pkgname
    cp -dr --no-preserve=ownership $srcdir/NanoWallet-$pkgver-linux64/* $pkgdir/opt/$pkgname
    ln -sf /opt/nem-wallet/NanoWallet $pkgdir/usr/bin/nem-wallet
}
