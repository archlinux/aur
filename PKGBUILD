# Maintainer: Nikolai Oplachko <magnickolas@gmail.com>
pkgname=remindee-bot
pkgver=0.4.1
pkgrel=1
pkgdesc="Reminder bot for Telegram without bullshit"
arch=('any')
url="https://github.com/magnickolas/remindee-bot"
license=('GPL3')
depends=()
makedepends=('cargo' 'rust' 'make' 'git')
options=(!debug !lto)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('f223842802b6e5c22bbb6c5a4dd35d77cc1bf1ab049bdd8459e51fc83a95fa43')

build() {
	cd "$pkgname"
	CARGO_INCREMENTAL=0 cargo build --release --locked
}

package() {
	cd "$pkgname"
	install -D -m755 "target/release/remindee-bot" "$pkgdir/usr/bin/remindee-bot"
}
