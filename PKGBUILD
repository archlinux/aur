pkgname=emercoin-bin
pkgver=0.7.10
pkgrel=2
pkgdesc="Emercoin is a digital currency and blockchain service platform."
arch=('i686' 'x86_64')    
depends=("libevent>=2.1.8" "qt5-base" "dbus>=1.10.14" "miniupnpc>=2.0.20170509" "expat>=2.2.0" "freetype2>=2.7.1" "protobuf")
url="http://emercoin.com/"
license=('GPL3')
install='emercoin.install'
source_i686=("https://github.com/emercoin/emercoin/releases/download/v${pkgver}emc/emercoin-${pkgver}-i686-pc-linux-gnu.tar.gz" "emercoin.install" "emercoind.service" "emc48.png" "com.emercoin.Emercoin.desktop")
source_x86_64=("https://github.com/emercoin/emercoin/releases/download/v${pkgver}emc/emercoin-${pkgver}-x86_64-linux-gnu.tar.gz" "emercoin.install" "emercoind.service" "emc48.png" "com.emercoin.Emercoin.desktop")
sha256sums_i686=(
	'993ddbebbd78bb654762d7dd9b0fb69bd365dc270a922d566d1adba0ac002174' 
	'9ab66d1537081746f5eec016628bc810d216ed393f062368decbeea3756bca35' 
	'9e0832225a161a0c2694890e4d1791eedf943f96556db153e3cd5e40906ef5ed'
	'99d13ec06eb0d09662632e9eb6309ee38e03162f09513b23747f189602552132'
	'dfa7a4c2f717bbc29ba4273d65f80e0ee5853379e0632e458ae12df1ace72fcf')
sha256sums_x86_64=(
	'6e851f289c652fd1055bd6084abe454ad172cc8df0926efcf05441e58fc14973' 
	'9ab66d1537081746f5eec016628bc810d216ed393f062368decbeea3756bca35' 
	'9e0832225a161a0c2694890e4d1791eedf943f96556db153e3cd5e40906ef5ed'
	'99d13ec06eb0d09662632e9eb6309ee38e03162f09513b23747f189602552132'
	'dfa7a4c2f717bbc29ba4273d65f80e0ee5853379e0632e458ae12df1ace72fcf'
)
package() {
    install -Dm644 ${srcdir}/emercoind.service ${pkgdir}/usr/lib/systemd/system/emercoind.service
    install -Dm644 "${srcdir}"/com.emercoin.Emercoin.desktop ${pkgdir}/usr/share/applications/com.emercoin.Emercoin.desktop
     install -Dm644 "${srcdir}"/emc48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/emercoin.png
    cd "emercoin-$pkgver"
    install -Dm6750 ./bin/emercoind $pkgdir/usr/bin/emercoind
    install -Dm6750 ./bin/emercoin-qt $pkgdir/usr/bin/emercoin-qt
    install -Dm6750 ./bin/emercoin-tx $pkgdir/usr/bin/emercoin-tx
    install -Dm6750  ./bin/emercoin-cli $pkgdir/usr/bin/emercoin-cli
    install -Dm444  ./include/emercoinconsensus.h $pkgdir/usr/include/emercoinconsensus.h
    install -D ./lib/libemercoinconsensus.so $pkgdir/usr/lib/libemercoinconsensus.so
    install -D ./lib/libemercoinconsensus.so.0 $pkgdir/usr/lib/libemercoinconsensus.so.0
    install -Dm6770  ./lib/libemercoinconsensus.so.0.0.0 $pkgdir/usr/lib/libemercoinconsensus.so.0.0.0
    install -Dm444  ./share/man/man1/bitcoind.1 $pkgdir/share/man/man1/bitcoind.1 
    install -Dm444  ./share/man/man1/bitcoin-qt.1 $pkgdir/share/man/man1/bitcoin-qt.1
    install -Dm444  ./share/man/man1/bitcoin-tx.1 $pkgdir/share/man/man1/bitcoin-tx.1
    install -Dm444  ./share/man/man1/bitcoin-cli.1 $pkgdir/share/man/man1/bitcoin-cli.1

}
