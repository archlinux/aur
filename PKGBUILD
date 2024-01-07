# Maintainer: éclairevoyant

pkgname=zsh-nix-shell
pkgver=0.8.0
pkgrel=1
pkgdesc="zsh plugin to use zsh in nix-shell shells"
arch=(any)
url="https://github.com/chisui/zsh-nix-shell"
license=(BSD)
depends=(zsh)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ccd000a382be4d975bea4de360dc52fb60f18ddc94f05069870578a3fa844e919f1f10d2a2c45ed6a5861ce391373806062bb2dbe7ec767ecd6fec00604d04c4')

package() {
	cd $pkgname-$pkgver

	install -Dm644 nix-shell.plugin.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dm755 scripts/buildShellShim -t "$pkgdir/usr/share/zsh/plugins/$pkgname/scripts/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

