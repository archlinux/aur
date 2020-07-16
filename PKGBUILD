# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgbase=bitcoinhd
pkgname=('bitcoinhd-daemon' 'bitcoinhd-cli' 'bitcoinhd-qt' 'bitcoinhd-tx')
pkgver=1.4.3
pkgrel=1
commit=7fe720529
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
sha256sums=('d8e5713d68156ca48b4995e0bef6097f1c420126939c95200d9a5cff9896365e'
            'b3457e63ea098aa055655ad1d5cc7800f100f84b4e66f80e737d337a49672d8b'
            '8ae5cb7326f3c2525ca94f6b917d3f8f38b5027425133c40172c663946a92e33'
            'b53073ee92683cf2dc82cac1ea551f5bfdc6ddf0715d69be0ee1a7908051ef1d'
            '4b1172d754df7ac84b7e5525a122abde0a0ef6ca45319eaca5838b026c169b84'
            '0c968e539ec298a8fc2cd691ccabd5cddb9b8c7e7035fe3061f4db9fd4e6d604')
sha256sums_x86_64=('d5c1887693c2f9d56f44476315ac2f7c68c5ac9751d23c1b988b3ea6e15108bf')
sha256sums_i686=('f9a435277a30ee075da989bf13fdfaa4b2c6fd20e274252c6936acf9721f281f')
sha256sums_armv7h=('1e5abee5de2533fb60ada173314fdd710692ac6ec41d0076b71585202295b331')
sha256sums_aarch64=('5640f2115e6e38e4124442b04d58d06f7abfed84a41fab81c1b2900618344bb3')

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
