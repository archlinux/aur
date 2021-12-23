# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.6.0
pkgrel=2
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('60e04e39316fee00ef25b659f18386c6')
sha1sums=('6f26941e06bf79de6e2ce9dbf3c71de3fbb1bd08')
sha512sums=('18a4debc447cf958e45f96c083a94ee64b6f92c4761f0310f67f665a253e5884b2aa12428aee81be242b2dc5255dac40ee96f534f72e9c82a3bac97ca8eb1ff9')

package() {
	cd "$pkgname-$pkgver"

	export RUSTFLAGS='--cap-lints=allow'
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
