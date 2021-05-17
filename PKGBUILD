# Maintainer: Cyber Knight <cyberknight755@gmail.com>

pkgname='osfetch-rs'
pkgdesc="A fetch utility written in rust"
pkgver=0.1.0
pkgrel=1
epoch=
arch=('any')
url="https://gitlab.com/cyberknight777/osfetch-rs"
license=('MIT')
groups=()
depends=('rust')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=$pkgname.install
source=("git+$url")
md5sums=('SKIP')
prepare() {
	cd "$pkgname"
	cargo build --release
}

build() {
	cd "$pkgname"
}


package() {
	cd "$pkgname"
	unset LD_PRELOAD
	sudo install -Dm755 "target/release/osfetch-rs" /usr/bin
        sudo install -Dm644 "LICENSE" /usr/share/$pkgname/LICENSE
}
