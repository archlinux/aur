# Maintainer: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgbase=dogecoin
pkgname=('dogecoin-cli-bin' 'dogecoin-qt-bin' 'dogecoin-tx-bin')
pkgver=1.14.5
pkgrel=1
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
            'ea6fb939303585677397af476a4061bc21e8840da24d349e73b5d4c48843aa27')
sha256sums_x86_64=('17a03f019168ec5283947ea6fbf1a073c1d185ea9edacc2b91f360e1c191428e')
sha256sums_i686=('7e7dd731ecfb2b78d6cc50d013ebf5faceeab50c59ffa2ab7551167b1bb81f08')
sha256sums_armv7h=('dfdcdc6bb36076e7634cc8ed89138ec0383d73ba42b3e7ecfa9279b8949bce6b')
sha256sums_aarch64=('f3bc387f393a0d55b6f653aef24febef6cb6f352fab2cbb0bae420bddcdacd1c')

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
