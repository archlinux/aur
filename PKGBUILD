# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgbase=bitcoinhd
pkgname=('bitcoinhd-daemon' 'bitcoinhd-cli' 'bitcoinhd-qt' 'bitcoinhd-tx')
pkgver=1.4.1
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://btchd.org/"
license=('MIT')
source=("$pkgbase-$pkgver-src.tar.gz::https://github.com/btchd/btchd/archive/v$pkgver.tar.gz"
        "bitcoinhd-qt.desktop"
        "bhd-cli.sh"
        "bhd-qt.sh"
        "start-bhdd.sh"
        "stop-bhdd".sh)
source_x86_64=("$pkgbase-$pkgver-x86_64.tar.gz::https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-42517870d-x86_64-linux-gnu.tar.gz")
source_i686=("$pkgbase-$pkgver-i686.tar.gz::https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-42517870d-i686-linux-gnu.tar.gz")
source_armv7h=("$pkgbase-$pkgver-armv7h.tar.gz::https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-42517870d-arm-linux-gnueabihf.tar.gz")
source_aarch64=("$pkgbase-$pkgver-aarch64.tar.gz::https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-42517870d-aarch64-linux-gnu.tar.gz")
sha256sums=('b065601f8653cba6cb5ebb5c8dd1ed0d087c0dfd47af68b3ada6f47ac4760268'
            'b3457e63ea098aa055655ad1d5cc7800f100f84b4e66f80e737d337a49672d8b'
            '4178fd9173eadb24f13a254f567c37eb77521c2d6d57d9b2cfe913483967298b'
            '939bef185f8cb1ddb5e554ed55dbab2ac458af4f7856af155b07d54eef370a18'
            'cc342560bfc5f0907293afd0f219f9bf4b81f78131fbb3ff61a25375257025a3'
            '0bd306f1fe25797e5987336111ea931d3453de9097571f5fd7028a3dfe4663b6')
sha256sums_x86_64=('fb84c947c95a489944f798d1008c3ff9dd010c23eeb7bcfe494ef86d9b8d710d')
sha256sums_i686=('5599084c005815f15ac725e775967fc3fc05e64099d03166e753a97f21a6ce83')
sha256sums_armv7h=('a540e345489f435e4a1e6125e9dbbbe4fe8f4cacdfdf3a92d49c57dde10470df')
sha256sums_aarch64=('0317f363262a9b83cdf7cff00139bd4f5ff16a4b39df20b5e3691d6f8009a818')

package_bitcoinhd-qt() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - Qt"
	depends=(boost-libs libevent qt5-base miniupnpc libminiupnpc.so qrencode protobuf zeromq)

	install -Dm755 bhd-v$pkgver/bin/btchd-qt $pkgdir/usr/bin/btchd-qt
	install -Dm644 bhd-v$pkgver/share/man/man1/btchd-qt.1 $pkgdir/usr/share/man/man1/btchd-qt.1
	install -Dm644 btchd-$pkgver/share/pixmaps/bitcoin128.png $pkgdir/usr/share/pixmaps/btchd128.png
	install -Dm644 btchd-$pkgver/COPYING $pkgdir/usr/share/licenses/btchd/COPYING

	install -Dm755 bhd-qt.sh $pkgdir/usr/local/bin/bhd-qt
	install -Dm755 bitcoinhd-qt.desktop $pkgdir/usr/share/applications/btchd-qt.desktop
}

package_bitcoinhd-daemon() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - daemon"
	depends=(boost-libs libevent miniupnpc libminiupnpc.so zeromq)
	backup=('etc/btchd/btchd.conf')

	install -Dm755 bhd-v$pkgver/bin/btchdd $pkgdir/usr/bin/btchdd
	install -Dm644 bhd-v$pkgver/share/man/man1/btchdd.1 $pkgdir/usr/share/man/man1/btchdd.1
	install -Dm644 btchd-$pkgver/share/examples/btchd.conf $pkgdir/etc/btchd/btchd.conf
	install -Dm644 btchd-$pkgver/COPYING $pkgdir/usr/share/licenses/btchd/COPYING

	install -Dm755 start-bhdd.sh $pkgdir/usr/local/bin/start-bhdd
	install -Dm755 stop-bhdd.sh $pkgdir/usr/local/bin/stop-bhdd
}

package_bitcoinhd-cli() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - RPC client"
	depends=(boost-libs libevent)

	install -Dm755 bhd-v$pkgver/bin/btchd-cli $pkgdir/usr/bin/btchd-cli
	install -Dm644 bhd-v$pkgver/share/man/man1/btchd-cli.1 $pkgdir/usr/share/man/man1/btchd-cli.1
	install -Dm644 btchd-$pkgver/COPYING $pkgdir/usr/share/licenses/btchd/COPYING

	install -Dm755 bhd-cli.sh $pkgdir/usr/local/bin/bhd-cli
}

package_bitcoinhd-tx() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - Transaction tool"
	depends=(boost-libs openssl)

	install -Dm755 bhd-v$pkgver/bin/btchd-tx $pkgdir/usr/bin/btchd-tx
	install -Dm644 bhd-v$pkgver/share/man/man1/btchd-tx.1 $pkgdir/usr/share/man/man1/btchd-tx.1
	install -Dm644 btchd-$pkgver/COPYING $pkgdir/usr/share/licenses/btchd/COPYING
}
