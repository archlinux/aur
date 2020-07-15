# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgbase=bitcoinhd
pkgname=('bitcoinhd-daemon' 'bitcoinhd-cli' 'bitcoinhd-qt' 'bitcoinhd-tx')
pkgver=1.4.2
pkgrel=1
commit=52bb5b0fd
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://btchd.org/"
license=('MIT')
source=("$pkgbase-$pkgver-src.tar.gz::https://github.com/btchd/btchd/archive/v$pkgver.tar.gz"
        "bitcoinhd-qt.desktop"
        "bhd-cli.sh"
        "bhd-qt.sh"
        "start-bhdd.sh"
        "stop-bhdd".sh)
source_x86_64=("$pkgbase-$pkgver-x86_64.tar.gz::https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-$commit-x86_64-linux-gnu.tar.gz")
source_i686=("$pkgbase-$pkgver-i686.tar.gz::https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-$commit-i686-linux-gnu.tar.gz")
source_armv7h=("$pkgbase-$pkgver-armv7h.tar.gz::https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-$commit-arm-linux-gnueabihf.tar.gz")
source_aarch64=("$pkgbase-$pkgver-aarch64.tar.gz::https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-$commit-aarch64-linux-gnu.tar.gz")
sha256sums=('49bdee4de3979c6e8ef3913e9e5a15f758d81e7d14caca8be17d303beaa50f4f'
            'b3457e63ea098aa055655ad1d5cc7800f100f84b4e66f80e737d337a49672d8b'
            '8ae5cb7326f3c2525ca94f6b917d3f8f38b5027425133c40172c663946a92e33'
            'b53073ee92683cf2dc82cac1ea551f5bfdc6ddf0715d69be0ee1a7908051ef1d'
            '4b1172d754df7ac84b7e5525a122abde0a0ef6ca45319eaca5838b026c169b84'
            '0c968e539ec298a8fc2cd691ccabd5cddb9b8c7e7035fe3061f4db9fd4e6d604')
sha256sums_x86_64=('fc6d4ff462bf8831f7114fdf67421b56605d6d94a39345f0aaf24dc6422e2805')
sha256sums_i686=('5c0a9a7dbef91806331ecb2d64aa2d79b5904f6eaab2dfae50baa1662a3a1924')
sha256sums_armv7h=('652d1a575d497a5af6766b6f75c66490f4bece7aa6f8204a156b70fed9991b67')
sha256sums_aarch64=('47dfbc3e7ad25ffd88b95507dbdb6a487f388cb823852c72f3d3b7968fb01632')

package_bitcoinhd-qt() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - Qt"
	depends=(boost-libs libevent qt5-base miniupnpc libminiupnpc.so qrencode protobuf zeromq)

	install -Dm755 bhd-v$pkgver/bin/btchd-qt $pkgdir/usr/bin/btchd-qt
	install -Dm644 bhd-v$pkgver/share/man/man1/btchd-qt.1 $pkgdir/usr/share/man/man1/btchd-qt.1
	install -Dm644 btchd-$pkgver/share/pixmaps/bitcoin128.png $pkgdir/usr/share/pixmaps/btchd128.png
	install -Dm644 btchd-$pkgver/COPYING $pkgdir/usr/share/licenses/btchd/COPYING

	install -Dm755 bhd-qt.sh $pkgdir/usr/local/bin/bhd-qt
	install -Dm644 bitcoinhd-qt.desktop $pkgdir/usr/share/applications/btchd-qt.desktop
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
