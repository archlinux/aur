# Maintainer: éclairevoyant

pkgname=zsh-nix-shell
pkgver=0.7.0
pkgrel=1
pkgdesc="zsh plugin to use zsh in nix-shell shells"
arch=(any)
url="https://github.com/chisui/zsh-nix-shell"
license=(BSD)
depends=(zsh)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('353aa72fbd1c8dde9da00239a285b37bf0b884ac0536b72b2e093207896043f0538cee4e864c93eb36b7210acee32314870d90c56e4a3a963badb1fdb931a43e')

package() {
	cd $pkgname-$pkgver

	install -Dm644 nix-shell.plugin.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dm755 scripts/buildShellShim -t "$pkgdir/usr/share/zsh/plugins/$pkgname/scripts/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

