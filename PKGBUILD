# Maintainer: jyantis <yantis@yantis.net>

pkgname=wallet-recover-bin
pkgver=0.3
pkgrel=1
pkgdesc='Search hard drives sector by sector for bitcoin private keys. Useful for finding lost bitcoin and recovering erased bitcoin wallets'
url='https://github.com/Hartland/wallet-recover-0.3'
arch=('i686' 'x86_64')
license=('custom')
depends=('gcc-libs')
if [ "$CARCH" = "x86_64" ]; then
    source=("https://github.com/Hartland/wallet-recover-0.3/raw/master/bin/64/wallet-recover"
            "https://github.com/Hartland/wallet-recover-0.3/raw/master/LICENSE.txt")
    md5sums=('518b22b0b2535b9c4dfaf1bbfd839a9b'
             '8cf03855d2affaeb70b7e412601626d2')
else
    source=("https://github.com/Hartland/wallet-recover-0.3/raw/master/bin/32/wallet-recover"
            "https://github.com/Hartland/wallet-recover-0.3/raw/master/LICENSE.txt")
    md5sums=('8b247358955a45206a5862e962094d37'
             '8cf03855d2affaeb70b7e412601626d2')
fi

package() {
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm755 "wallet-recover" "$pkgdir/usr/bin/wallet-recover"
}
