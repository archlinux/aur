# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgbase=bitcoinhd
pkgname=('bitcoinhd-daemon' 'bitcoinhd-cli' 'bitcoinhd-qt' 'bitcoinhd-tx')
pkgver=1.4.3
pkgrel=1
_commit=7fe720529
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'armv7h' 'aarch64')
url="https://btchd.org/"
license=('MIT')
source=("bitcoinhd-$pkgver-src.tar.gz::https://github.com/btchd/btchd/archive/v$pkgver.tar.gz"
        "bitcoinhd-qt.desktop")
source_x86_64=("https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-${_commit}-x86_64-linux-gnu.tar.gz")
source_i686=("https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-${_commit}-i686-linux-gnu.tar.gz")
source_pentium4=("https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-${_commit}-i686-linux-gnu.tar.gz")
source_armv6h=("https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-${_commit}-arm-linux-gnueabihf.tar.gz")
source_armv7h=("https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-${_commit}-arm-linux-gnueabihf.tar.gz")
source_aarch64=("https://github.com/btchd/btchd/releases/download/v$pkgver/bhd-v$pkgver-${_commit}-aarch64-linux-gnu.tar.gz")
sha512sums=('2be8103d34e2f6660f7215d314cd21a7921e0bdee7cf908f224be759160d499b93c62f24ddad7331e53990d8d53b1ed0bc3cee9c68a9327f34ebf8c5ef93bc1d'
            'e4eca2155ceba74078d95f45aed0e3157f094ad8eb8c565806a56da8b72b890cbfb4d10a9a99532c420a8b64838f85969bc00f90e4162efb2e758d71a93ac3c3')
sha512sums_x86_64=('c48c92488d82ccb86c0a27c2ee8790e47ebe6c4d1dee0758e6c12641f8c77c56f34e605fad32a32144fde8e527e39a7e66b053147a59f0faa0ba759d92f3a4d8')
sha512sums_i686=('47cfdd20df16afd0b68d3306706c8ba74f02a5c1e37d4762ad923452458957c9614ef7d59737e74ca9d12dd0b348e0e542ccf1655420f3873852636910a54111')
sha512sums_pentium4=('47cfdd20df16afd0b68d3306706c8ba74f02a5c1e37d4762ad923452458957c9614ef7d59737e74ca9d12dd0b348e0e542ccf1655420f3873852636910a54111')
sha512sums_armv6h=('06b81e7399d63a781a2f516d7d5c7cb69f404ffe56c6a1a6b09773703da06efbdde96ab68c70255a22a23162c278099a323ad7359f1dccb379daffcedb59a26a')
sha512sums_armv7h=('06b81e7399d63a781a2f516d7d5c7cb69f404ffe56c6a1a6b09773703da06efbdde96ab68c70255a22a23162c278099a323ad7359f1dccb379daffcedb59a26a')
sha512sums_aarch64=('e067cdb39834bf04919a17553864c33abf3528fe4fff17177b4de8a662b00fb423e763176e88405ca323bd74c0425ebb4de4d36ecc98e6ba0be70414e489eccb')

package_bitcoinhd-qt() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - Qt (binary package)"
	depends=('boost-libs' 'hicolor-icon-theme' 'libevent' 'miniupnpc' 'protobuf' 'qrencode' 'qt5-base' 'zeromq')

	install -Dm755 bhd-v$pkgver/bin/btchd-qt "$pkgdir"/usr/bin/btchd-qt
	install -Dm644 bhd-v$pkgver/share/man/man1/btchd-qt.1 "$pkgdir"/usr/share/man/man1/btchd-qt.1
	install -Dm644 btchd-$pkgver/share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/btchd128.png

	if [ ! -f "/usr/share/licenses/btchd/COPYING" ]; then
	    install -Dm644 btchd-$pkgver/COPYING "$pkgdir"/usr/share/licenses/btchd/COPYING
	fi
	install -Dm644 bitcoinhd-qt.desktop "$pkgdir"/usr/share/applications/btchd-qt.desktop
}

package_bitcoinhd-daemon() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - daemon (binary package)"
	depends=('boost-libs' 'libevent' 'miniupnpc' 'zeromq')
	backup=('etc/btchd/btchd.conf')

	install -Dm755 bhd-v$pkgver/bin/btchdd "$pkgdir"/usr/bin/btchdd
	install -Dm644 bhd-v$pkgver/share/man/man1/btchdd.1 "$pkgdir"/usr/share/man/man1/btchdd.1
	install -Dm644 btchd-$pkgver/share/examples/btchd.conf "$pkgdir"/etc/btchd/btchd.conf

	if [ ! -f "/usr/share/licenses/btchd/COPYING" ]; then
	    install -Dm644 btchd-$pkgver/COPYING "$pkgdir"/usr/share/licenses/btchd/COPYING
	fi
}

package_bitcoinhd-cli() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - RPC client (binary package)"
	depends=('boost-libs' 'libevent')

	install -Dm755 bhd-v$pkgver/bin/btchd-cli "$pkgdir"/usr/bin/btchd-cli
	install -Dm644 bhd-v$pkgver/share/man/man1/btchd-cli.1 "$pkgdir"/usr/share/man/man1/btchd-cli.1

	if [ ! -f "/usr/share/licenses/btchd/COPYING" ]; then
	    install -Dm644 btchd-$pkgver/COPYING "$pkgdir"/usr/share/licenses/btchd/COPYING
	fi
}

package_bitcoinhd-tx() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - Transaction tool (binary package)"
	depends=('boost-libs' 'openssl')

	install -Dm755 bhd-v$pkgver/bin/btchd-tx "$pkgdir"/usr/bin/btchd-tx
	install -Dm644 bhd-v$pkgver/share/man/man1/btchd-tx.1 "$pkgdir"/usr/share/man/man1/btchd-tx.1

	if [ ! -f "/usr/share/licenses/btchd/COPYING" ]; then
	    install -Dm644 btchd-$pkgver/COPYING "$pkgdir"/usr/share/licenses/btchd/COPYING
	fi
}
