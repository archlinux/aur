# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.7.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('d721122d26b605830da47d56298f3d24')
sha1sums=('f82622470a49a883941aa619a48946ceaa709efd')
sha512sums=('b0ebbc6ac158c8ed8a517629883b551cc33bbcc6d408f0380430f28f10ac5fe7d8b3a9b82da5a4a21bc54fca3bd13532a1c297bc7f87521e35ccf33f97917a45')

package() {
	cd "$pkgname-$pkgver"

	export RUSTFLAGS='--cap-lints=allow'
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
