# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgname='xrphd-qt'
pkgver=1.0.5
pkgrel=1
commit=8e6dd60
arch=('x86_64')
url="https://xrphd.org"
license=('MIT')
source=("https://xrphd.org/public/wallets/xhd-v$pkgver.0-$commit-x86_64-linux-gnu.tar.gz"
        "xrphd-qt.desktop"
        "xhd-qt.sh"
        "xrphd128.png")
sha256sums=('590f596b5ebba73c986fca91dd0d6acbc24b57fbcc356c8f599a4dabe2441836'
            '498ec02ea83c0eaedc159c31945360da608031cf05c743c1d4b0ef3b8721c274'
            '4099187d23fab321e85e792d5189a44b7571997d38c343f6354ae903adcbf80e'
            '5d8aa9d0cbf873fa08c23890ec37a237ddd822277652e87d20b999b8dac1f7a4')

package() {
	pkgdesc="XRPHD is a peer-to-peer network based digital currency"
	depends=(boost-libs libevent qt5-base miniupnpc libminiupnpc.so qrencode protobuf zeromq)

	install -Dm755 xhd-v$pkgver/bin/xrphd-qt $pkgdir/usr/bin/xrphd-qt
	install -Dm644 xhd-v$pkgver/share/man/man1/xrphd-qt.1 $pkgdir/usr/share/man/man1/xrphd-qt.1

	install -Dm644 xrphd128.png $pkgdir/usr/share/pixmaps/xrphd128.png
	install -Dm755 xhd-qt.sh $pkgdir/usr/local/bin/xhd-qt
	install -Dm644 xrphd-qt.desktop $pkgdir/usr/share/applications/xrphd-qt.desktop

	mkdir -p $pkgdir/usr/lib/xrphd
	cp -r xhd-v$pkgver/lib/* $pkgdir/usr/lib/xrphd
}
