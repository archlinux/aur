pkgname=mfcoin-bin
pkgver=3.0.0
pkgrel=0
pkgdesc="MFCoin is a digital currency and blockchain service platform."
arch=('x86_64')    
depends=("libevent>=2.1.8" "qt5-base" "dbus>=1.10.14" "miniupnpc>=2.0.20170509" "expat>=2.2.0" "freetype2>=2.7.1" "protobuf")
url="https://mfcoin.net/"
license=('GPL3')
install='mfcoin.install'
source_x86_64=("https://github.com/MFrcoin/MFCoin/releases/download/v.${pkgver}.${pkgrel}/mfcoin-linux.01.10.19.zip" "mfcoin.install")
sha256sums_x86_64=('f25db13c2a6abf30294e2d2c7ceaf8db0fa0313e4777f24014d95ed69496472b' 'b03fb0e7f61820a11c030dc4ec627b7d618cb8e71f5983e2b9e18a77903e6701')
package() {
    cd $(ls -d */)
    install -D -m771 ./bin/mfcoind $pkgdir/usr/bin/mfcoind
    install -D -m771 ./bin/mfcoin-qt $pkgdir/usr/bin/mfcoin-qt
    install -D -m771 ./bin/mfcoin-tx $pkgdir/usr/bin/mfcoin-tx
    install -D -m771  ./bin/mfcoin-cli $pkgdir/usr/bin/mfcoin-cli
    install -D -m444  ./include/mfcoinconsensus.h $pkgdir/usr/include/mfcoinconsensus.h
    install -D -m444  ./share/man/man1/bitcoind.1 $pkgdir/share/man/man1/mfcoind.1 
    install -D -m444  ./share/man/man1/bitcoin-qt.1 $pkgdir/share/man/man1/mfcoin-qt.1
    install -D -m444  ./share/man/man1/bitcoin-tx.1 $pkgdir/share/man/man1/mfcoin-tx.1
    install -D -m444  ./share/man/man1/bitcoin-cli.1 $pkgdir/share/man/man1/mfcoin-cli.1

}
