pkgname=warp-packer
pkgver=0.4.5.1
pkgrel=1
pkgdesc="Create self-contained single binary applications making it sipmler and more ergonomic to deliver your application to your customers"
url=https://github.com/OpenHelios/warp
license=(MIT)
arch=('x86_64')
makedepends=(rust)
source=($pkgname::git+$url.git#tag=v$pkgver)
sha1sums=(SKIP)

_gitroot=$pkgname

build() {
	cd $_gitroot
#	rustup default stable
#	rustup update
#	cargo update
	cargo build --release -p warp-runner
	cargo build --release -p warp-packer
}

package() {
	cd $_gitroot
	install -Dm755 target/release/warp-packer $pkgdir/usr/bin/warp-packer
}

