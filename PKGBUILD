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
b2sums=('8355cc6c80b902c0dc64570da3b914d2c631dda64f4ba685996063714823135066b7ae727a92efc8a8b8d1de2a6fea9adb7d60cf96fdef4c9b795223b91f51f0')

package() {
	cd $pkgname-$pkgver

	install -Dm644 nix-shell.plugin.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dm755 scripts/buildShellShim -t "$pkgdir/usr/share/zsh/plugins/$pkgname/scripts/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

