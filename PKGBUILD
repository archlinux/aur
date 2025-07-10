# Maintainer: Nikolai Oplachko <magnickolas@gmail.com>
pkgname=remindee-bot
pkgver=0.3.2
pkgrel=1
pkgdesc="Reminder bot for Telegram without bullshit"
arch=('any')
url="https://github.com/magnickolas/remindee-bot"
license=('GPL3')
depends=()
makedepends=('cargo' 'rust' 'make' 'git')
options=(!debug !lto)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('67ba370fc1978a648cbce01e6c124b873919d8e0c6e591e18cf1a05004d8a2e9')

build() {
	cd "$pkgname"
	CARGO_INCREMENTAL=0 cargo build --release --locked
}

package() {
	cd "$pkgname"
	install -D -m755 "target/release/remindee-bot" "$pkgdir/usr/bin/remindee-bot"
}
