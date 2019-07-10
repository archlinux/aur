# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=nem-wallet
pkgver=2.4.4
pkgrel=1
pkgdesc="Nano Wallet"
arch=('i686' 'x86_64')
url="https://github.com/NemProject/NanoWallet"
license=('MIT')
options=('!strip')
source=(https://github.com/NemProject/NanoWallet/releases/download/$pkgver/NEM-Wallet-$pkgver.zip
        nem-wallet.desktop)
sha256sums=('889c97342f48e6ff8f6f5fabd088ff0d5f60aa9aeb28ae94df24cf70f081cdef'
            '64f9577edd1cc77115b4e71811f873555d78f89667eed09e409a871e4375a4df')

package() {
    install -dm755 "$pkgdir/opt/$pkgname"
    install -Dm644 $srcdir/NEM-Wallet-$pkgver/*.* -t "$pkgdir/opt/$pkgname"
    install -dm755 $pkgdir/opt/$pkgname/{css,images,tests,vendors}
    install -Dm644 $srcdir/NEM-Wallet-$pkgver/css/*.css -t "$pkgdir/opt/$pkgname/css"
    install -Dm644 $srcdir/NEM-Wallet-$pkgver/tests/* -t "$pkgdir/opt/$pkgname/tests"
    install -Dm644 $srcdir/NEM-Wallet-$pkgver/images/* -t "$pkgdir/opt/$pkgname/images"
    install -Dm644 $srcdir/NEM-Wallet-$pkgver/vendors/* -t "$pkgdir/opt/$pkgname/vendors"
    install -dm755 $pkgdir/opt/$pkgname/css/fonts
    install -Dm644 $srcdir/NEM-Wallet-$pkgver/css/fonts/* -t "$pkgdir/opt/$pkgname/css/fonts"
    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/NEM-Wallet-$pkgver/images/logomark.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
