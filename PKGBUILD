# Maintainer: éclairevoyant

pkgname=zsh-nix-shell
pkgver=0.5.0
pkgrel=1
pkgdesc="zsh plugin that lets you use zsh in nix-shell shells"
arch=('any')
url="https://github.com/chisui/zsh-nix-shell"
license=('BSD')
depends=('zsh')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ea931422e302c5e54063c2d77c882d32c6e1bc8ea58031652ba55cfd91c5fbb5')

package() {
	cd $pkgname-$pkgver

	install -Dm644 nix-shell.plugin.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dm755 ./scripts/buildShellShim -t "$pkgdir/usr/share/zsh/plugins/$pkgname/scripts/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

