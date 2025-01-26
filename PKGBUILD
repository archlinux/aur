# Maintainer: Nikolai Oplachko <magnickolas@gmail.com>
pkgname=remindee-bot
pkgver=0.2.10
pkgrel=1
pkgdesc="Reminder bot for Telegram without bullshit"
arch=('any')
url="https://github.com/magnickolas/remindee-bot"
license=('GPL3')
depends=()
makedepends=('cargo' 'rust' 'make' 'git')
options=(!debug !lto)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('54e4836d3db36f2efd32b92aaee9588b08038ae6d92eade89b6075fadb571020')

build() {
	cd "$pkgname"
	CARGO_INCREMENTAL=0 cargo build --release --locked
}

package() {
	cd "$pkgname"
	install -D -m755 "target/release/remindee-bot" "$pkgdir/usr/bin/remindee-bot"
}
