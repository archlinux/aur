# Maintainer: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgbase=dogecoin
pkgname=('dogecoin-cli-bin' 'dogecoin-qt-bin' 'dogecoin-tx-bin')
pkgver=1.14.3
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
sha256sums_x86_64=('a95cc29ac3c19a450e9083cc3ac24b6f61763d3ed1563bfc3ea9afbf0a2804fd')
sha256sums_i686=('c998e35ba3d8caf5bf5f2cec79c80e8cfea0ee9ccbaa5bff81b76ae72df9bbb1')
sha256sums_armv7h=('e572d5af93f8ff4a5178e1edbbc151410f311097a17a619c43ca92de0ef4e51a')
sha256sums_aarch64=('65671f9854fe04815a4a849e6cdd5b1701fa04627cd2acc68cfd1de2561f70e5')

package_dogecoin-qt-bin() {
	pkgdesc="Dogecoin is a peer-to-peer network based digital currency - Qt Interface"
	provides=(dogecoin-qt)
	conflicts=(dogecoin-qt)
	depends=(libx11 fontconfig freetype2)

	install -Dm755 $pkgbase-$pkgver/bin/dogecoin-qt $pkgdir/usr/bin/dogecoin-qt
	install -Dm644 $pkgbase-$pkgver/share/man/man1/dogecoin-qt.1 $pkgdir/usr/share/man/man1/dogecoin-qt.1
	install -Dm644 bitcoin128.png $pkgdir/usr/share/pixmaps/dogecoin128.png
	install -Dm644 COPYING $pkgdir/usr/share/licenses/dogecoin-qt-bin/COPYING
	install -Dm644 dogecoin-qt.desktop $pkgdir/usr/share/applications/dogecoin-qt.desktop
}

package_dogecoin-cli-bin() {
	pkgdesc="Dogecoin is a peer-to-peer network based digital currency - RPC client"
	provides=(dogecoin-cli)
	conflicts=(dogecoin-cli)
	depends=(gcc-libs)

	install -Dm755 $pkgbase-$pkgver/bin/dogecoin-cli $pkgdir/usr/bin/dogecoin-cli
	install -Dm644 $pkgbase-$pkgver/share/man/man1/dogecoin-cli.1 $pkgdir/usr/share/man/man1/dogecoin-cli.1
	install -Dm644 COPYING $pkgdir/usr/share/licenses/dogecoin-cli-bin/COPYING
}

package_dogecoin-tx-bin() {
	pkgdesc="Dogecoin is a peer-to-peer network based digital currency - Transaction tool"
	provides=(dogecoin-tx)
	conflicts=(dogecoin-tx)
	depends=(gcc-libs)

	install -Dm755 $pkgbase-$pkgver/bin/dogecoin-tx $pkgdir/usr/bin/dogecoin-tx
	install -Dm644 $pkgbase-$pkgver/share/man/man1/dogecoin-tx.1 $pkgdir/usr/share/man/man1/dogecoin-tx.1
	install -Dm644 COPYING $pkgdir/usr/share/licenses/dogecoin-tx-bin/COPYING
}
