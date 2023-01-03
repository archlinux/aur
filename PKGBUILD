# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-tagbar
_reponame=tagbar.kak
pkgver=0.1.3
pkgrel=3
pkgdesc='Source outline viewer for Kakoune'
arch=(any)
url="https://github.com/andreyorst/$_reponame"
license=(MIT)
depends=(ctags kakoune)
optdepends=('tmux: For split panes')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f2f5205c4d3b1922cd80b57ab181f56c3cd6c36638c6150450168a47a9d429d')

package() {
	cd "$_reponame-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" rc/tagbar.kak
}
