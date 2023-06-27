# Maintainer: Cheems Bread <CheemsBread505@proton.me>
pkgname='dailyverse-cli'
pkgbase='dailyverse-cli-git'
pkgver=1.0.0
pkgrel=1
pkgdesc="Daily verse software"
arch=(x86_64)
url="https://github.com/CheemsBread505/dailyverse-cli"
license=('CSL')
depends=('rust')
makedepends=('cargo' 'git')
replaces=('dailyverse-rust')
#source=("$pkgname-$pkgver.tar.gz"
#        "$pkgname-$pkgver.patch")
source=("dailyverse-cli::git+https://github.com/CheemsBread505/dailyverse-cli.git")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

build() {
	cd "$pkgname"
	cargo build --release --locked
}

check() {
	cd "$pkgname"
	cargo test --locked
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/dailyverse" "$pkgdir/usr/bin/dailyverse"
}

