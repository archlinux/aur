# Maintainer: Krafty Kactus <tkk13909@proton.me>

pkgname=sudo-askpass-git
pkgver=1.0.r17.8f7d350
pkgrel=1
pkgdesc="A simple askpass program so sudo doesn't look so boring"
arch=(x86_64)
url="https://github.com/Absolpega/sudo-askpass"
license=('MIT')
makedepends=(git cargo)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "sudo-askpass"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd sudo-askpass
	cargo build
}

package() {
	cd sudo-askpass
	sudo cp ./target/debug/sudo-askpass /usr/bin/
}
