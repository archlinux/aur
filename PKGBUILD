# Maintainer: Joel Tony <github at jaytau dot com>

pkgname=kite-cli-bin
_pkgname=kite-cli
pkgver=0.2.1
pkgrel=1
pkgdesc="Zerodha's official terminal app and CLI for Kite (prebuilt binary)"
arch=('x86_64' 'aarch64')
url='https://github.com/zerodha/kite-cli'
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
_src="$url/releases/download/v$pkgver/kite-$pkgver"
source_x86_64=("$_src-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_src-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('b4c12975fb86250959a4ad5a5e37413920278b6b1cc6b8a4fff0a4fc504b3419')
sha256sums_aarch64=('3469b389236031c2627cf6a1de201e92c03092b1aa745a109f1010441146bf25')

package() {
  install -Dm755 kite -t "$pkgdir/usr/bin/"
  install -Dm644 README.md INSTALL.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
