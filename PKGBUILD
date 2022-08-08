# Maintainer: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgbase=dogecoin
pkgname=('dogecoin-cli-bin' 'dogecoin-qt-bin' 'dogecoin-tx-bin')
pkgver=1.14.6
pkgrel=2
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://dogecoin.com"
license=('MIT')
source=("https://raw.githubusercontent.com/$pkgbase/$pkgbase/v$pkgver/share/pixmaps/dogecoin128.png"
        "https://raw.githubusercontent.com/$pkgbase/$pkgbase/v$pkgver/contrib/debian/$pkgbase-qt.desktop"
        "https://raw.githubusercontent.com/$pkgbase/$pkgbase/v$pkgver/COPYING")
source_x86_64=("https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver-x86_64-linux-gnu.tar.gz")
source_i686=("https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver-i686-pc-linux-gnu.tar.gz")
source_armv7h=("https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver-arm-linux-gnueabihf.tar.gz")
source_aarch64=("https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver-aarch64-linux-gnu.tar.gz")
sha256sums=('49df5d7e132a9ec1ccce2a680cc14298391f4ee7b3e4c8f007c99f5850ed040c'
            'a69139912fd61a4e785d6b31840b70b053fbdd9f4e82bee02049f254b50968b4'
            'b063686ca71d93ceb816ee48eb3a381dcb1dec22b21a4985d3cee5361ceaf3cc')
sha256sums_x86_64=('fe9c9cdab946155866a5bd5a5127d2971a9eed3e0b65fb553fe393ad1daaebb0')
sha256sums_i686=('3e60c4c818cb44abcca5b3bf9eff6baf86834c762e41d886c19bd721c00d0e24')
sha256sums_armv7h=('d0b7f5f4fbabb6a10078ac9cde1df7eb37bef4c2627cecfbf70746387c59f914')
sha256sums_aarch64=('87419c29607b2612746fccebd694037e4be7600fc32198c4989f919be20952db')

package_dogecoin-qt-bin() {
	pkgdesc="Dogecoin is a peer-to-peer network based digital currency - Qt Interface"
	provides=(dogecoin-qt)
	conflicts=(dogecoin-qt)
	depends=(libx11 fontconfig freetype2)

	install -Dm755 $pkgbase-$pkgver/bin/dogecoin-qt $pkgdir/usr/bin/dogecoin-qt
	install -Dm644 $pkgbase-$pkgver/share/man/man1/dogecoin-qt.1 $pkgdir/usr/share/man/man1/dogecoin-qt.1
	install -Dm644 dogecoin128.png $pkgdir/usr/share/pixmaps/dogecoin128.png
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
