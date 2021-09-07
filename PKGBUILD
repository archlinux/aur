# Maintainer: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgbase=dogecoin
pkgname=('dogecoin-cli-bin' 'dogecoin-qt-bin' 'dogecoin-tx-bin')
pkgver=1.14.4
pkgrel=2
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
sha256sums_x86_64=('6266235abe4bcbd41ea57bdf42f11ef89aa69f0386e8c8846d5228af69e7fa13')
sha256sums_i686=('6e93f5edccf528b44112f2088be3ac8f4f44151a757754da09c8c53cdd725815')
sha256sums_armv7h=('d023b7a6dfc5d92b1635f0fa03e14c9fc787a3eae94fba0cc3aca53b62a8e9ac')
sha256sums_aarch64=('72ee42424835cdfb4111b284c98f78919b7a9ede6f8d509b2abe31f7b3eb1f09')

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
