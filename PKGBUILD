# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgbase=dogecoin
pkgname=('dogecoin-cli' 'dogecoin-qt-bin' 'dogecoin-tx')
pkgver=1.14.2
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://dogecoin.com"
license=('MIT')
source=("https://raw.githubusercontent.com/$pkgbase/$pkgbase/v$pkgver/share/pixmaps/bitcoin128.png"
        "https://raw.githubusercontent.com/$pkgbase/$pkgbase/v$pkgver/contrib/debian/$pkgbase-qt.desktop"
        "https://raw.githubusercontent.com/$pkgbase/$pkgbase/v$pkgver/COPYING")
source_x86_64=("https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver-x86_64-linux-gnu.tar.gz")
source_i686=("https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver-i686-pc-linux-gnu.tar.gz")
source_armv7h=("https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver-arm-linux-gnueabihf.tar.gz")
source_aarch64=("https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver-aarch64-linux-gnu.tar.gz")
sha256sums=('49df5d7e132a9ec1ccce2a680cc14298391f4ee7b3e4c8f007c99f5850ed040c'
            'd5672cab8f48fb8634b7b9c163e9da46edc2c3829cd15af3b4a36f585b66d285'
            '93d633183b4715ff1d799dc26b30a6edae096a13fb35b062d0d69463f453644e')
sha256sums_x86_64=('10c400c8f2039b1f804b8a533266201a9e4e3b32a8854501e8a43792e1ee78e6')
sha256sums_i686=('6bdcfcbad88c0d9dfca180b8801f7d02e3ebf053b8657d2ed18bf0f253001cca')
sha256sums_armv7h=('60c3aac0c336dcc227a217b62571ed76c892cc37d0d08d0e07cd119344d00360')
sha256sums_aarch64=('b80bd2b55b67f218efde9498af18581244105c258e7790f7166df1afa1a89f1d')

package_dogecoin-qt-bin() {
	pkgdesc="Dogecoin is a peer-to-peer network based digital currency - Qt (Based on Binary Package)"
	depends=(boost-libs libevent qt5-base miniupnpc libminiupnpc.so qrencode protobuf zeromq)

	install -Dm755 $pkgbase-$pkgver/bin/dogecoin-qt $pkgdir/usr/bin/dogecoin-qt
	install -Dm644 $pkgbase-$pkgver/share/man/man1/dogecoin-qt.1 $pkgdir/usr/share/man/man1/dogecoin-qt.1
	install -Dm644 bitcoin128.png $pkgdir/usr/share/pixmaps/dogecoin128.png
	install -Dm644 COPYING $pkgdir/usr/share/licenses/dogecoin/COPYING
	install -Dm644 dogecoin-qt.desktop $pkgdir/usr/share/applications/dogecoin-qt.desktop
}

package_dogecoin-cli() {
	pkgdesc="Dogecoin is a peer-to-peer network based digital currency - RPC client"
	depends=(boost-libs libevent)

	install -Dm755 $pkgbase-$pkgver/bin/dogecoin-cli $pkgdir/usr/bin/dogecoin-cli
	install -Dm644 $pkgbase-$pkgver/share/man/man1/dogecoin-cli.1 $pkgdir/usr/share/man/man1/dogecoin-cli.1
	install -Dm644 COPYING $pkgdir/usr/share/licenses/dogecoin/COPYING
}

package_dogecoin-tx() {
	pkgdesc="Dogecoin is a peer-to-peer network based digital currency - Transaction tool"
	depends=(boost-libs openssl)

	install -Dm755 $pkgbase-$pkgver/bin/dogecoin-tx $pkgdir/usr/bin/dogecoin-tx
	install -Dm644 $pkgbase-$pkgver/share/man/man1/dogecoin-tx.1 $pkgdir/usr/share/man/man1/dogecoin-tx.1
	install -Dm644 COPYING $pkgdir/usr/share/licenses/dogecoin/COPYING
}
