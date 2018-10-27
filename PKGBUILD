pkgname=hitman
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple process killer"
url="https://gitlab.com/timlyo/Hitman"
depends=("rust")
makedepends=("git" "cargo")
arch=("i686" "x86_64" "armv7h")
license=("MIT")
md5sums=("SKIP")
source=("git+https://gitlab.com/timlyo/Hitman.git")

build() {
	cd Hitman
	cargo build --release
}

package() {
	cd Hitman
	install -Dm755 target/release/hitman "$pkgdir/usr/bin/hitman"
}
