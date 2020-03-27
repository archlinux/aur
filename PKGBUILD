# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-tagbar
_reponame=tagbar.kak
pkgver=0.1.3
pkgrel=1
pkgdesc='Source outline viewer for Kakoune'
arch=(any)
url="https://gitlab.com/andreyorst/$_reponame"
license=(MIT)
depends=(ctags kakoune)
optdepends=('tmux: For split panes')
install="$pkgname.install"
source=("$url/-/archive/v$pkgver/$_reponame-v$pkgver.tar.gz")
sha256sums=('c4e93684a3327264c853a24bd331a225aba07da3526eb819fd94c606b6286eed')

package() {
	cd "$_reponame-v$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/$pkgname/rc" rc/tagbar.kak
}
