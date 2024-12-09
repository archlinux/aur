# Contributor: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=dogecoin
pkgname=('dogecoin-cli-bin' 'dogecoin-qt-bin' 'dogecoin-tx-bin')
pkgver=1.14.9
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://dogecoin.com'
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
            'ff692211a86e69de91712125c9d6015fa5b1d15125329f80c09a9b61ec464bf6')
sha256sums_x86_64=('4f227117b411a7c98622c970986e27bcfc3f547a72bef65e7d9e82989175d4f8')
sha256sums_i686=('b8e1846a0979f369042dcf14435dfcea704b1456e34bc9657f0829d9eac0d3b0')
sha256sums_armv7h=('311fe8aee346d3f9a00c0a8ac594224ca3bfa297fec8a5fae20bb70f28961421')
sha256sums_aarch64=('6928c895a20d0bcb6d5c7dcec753d35c884a471aaf8ad4242a89a96acb4f2985')

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
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
