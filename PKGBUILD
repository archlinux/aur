# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.9.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://codeberg.org/flausch/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('151058d8d231dc74df41ece398538d05')
sha1sums=('9f5039fa37eb0248dc921ce4f6a5a20edf901c1f')
sha512sums=('b9cfb538750de77ce8f2802a2e9bb264d60693100bb78ac71426741392231fe5e0dbcd6cfad7715e84dba893415e132714b08ca31fcfbc1fbc410065c638ddc9')

build() {
	cd "$pkgname"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
