pkgname=emercoin
pkgver=0.7.4
pkgrel=1
pkgdesc="Emercoin is a digital currency and blockchain service platform."
arch=('i686' 'x86_64')    
depends=("libevent>=2.1.8" "qt5-base" "dbus>=1.10.14" "miniupnpc>=2.0.20170509" "expat>=2.2.0" "freetype2>=2.7.1" "protobuf")
url="http://emercoin.com/"
license=('GPL3')
install='emercoin.install'
source_i686=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}emc/${pkgname}-${pkgver}-${arch}-pc-linux-gnu.tar.gz" "emercoin.install")
source_x86_64=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}emc/${pkgname}-${pkgver}-${arch}-linux-gnu.tar.gz" "emercoin.install")
sha256sums_i686=('2ff2527f049411131403b282d4b1f87cba5be2e64ccbaabddd08fd4fc7bc5f83' 'fae0ebd505eeb13cf1b4ee1ae3b3014e02a6422c77194e2a4d44c481262ceb8e')
sha256sums_x86_64=('363e02d8f9b7e2dbd10220fc327826d188294ccb75920c9a36b2f233ac0e978e' 'fae0ebd505eeb13cf1b4ee1ae3b3014e02a6422c77194e2a4d44c481262ceb8e')
package() {
    cd "$pkgname-$pkgver"
    install -D -m771 ./bin/emercoind $pkgdir/usr/bin/emercoind
    install -D -m771 ./bin/emercoin-qt $pkgdir/usr/bin/emercoin-qt
    install -D -m771 ./bin/emercoin-tx $pkgdir/usr/bin/emercoin-tx
    install -D -m771  ./bin/emercoin-cli $pkgdir/usr/bin/emercoin-cli
    install -D -m444  ./include/emercoinconsensus.h $pkgdir/usr/include/emercoinconsensus.h
    install -D ./lib/libemercoinconsensus.so $pkgdir/usr/lib/libemercoinconsensus.so
    install -D ./lib/libemercoinconsensus.so.0 $pkgdir/usr/lib/libemercoinconsensus.so.0
    install -D -m6770  ./lib/libemercoinconsensus.so.0.0.0 $pkgdir/usr/lib/libemercoinconsensus.so.0.0.0
    install -D -m444  ./share/man/man1/bitcoind.1 $pkgdir/share/man/man1/bitcoind.1 
    install -D -m444  ./share/man/man1/bitcoin-qt.1 $pkgdir/share/man/man1/bitcoin-qt.1
    install -D -m444  ./share/man/man1/bitcoin-tx.1 $pkgdir/share/man/man1/bitcoin-tx.1
    install -D -m444  ./share/man/man1/bitcoin-cli.1 $pkgdir/share/man/man1/bitcoin-cli.1

}
