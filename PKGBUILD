# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=rathole-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A lightweight and high-performance reverse proxy for NAT traversal"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/rapiz1/rathole"
license=('Apache')
depends=(openssl glibc gcc-libs)
# makedepends=(upx)
source_x86_64=("https://github.com/rapiz1/rathole/releases/download/v$pkgver/rathole-x86_64-unknown-linux-gnu.zip")
source_aarch64=("https://github.com/rapiz1/rathole/releases/download/v$pkgver/rathole-aarch64-unknown-linux-musl.zip")
source_armv7h=("https://github.com/rapiz1/rathole/releases/download/v$pkgver/rathole-armv7-unknown-linux-musleabihf.zip")
sha256sums_x86_64=('3e7d0d0f365120cd3cd351d147d1a12ee960c8068b464d4dd533a3821873b80e')
sha256sums_aarch64=('fa4a6fc63d86f8f1faa7c103a845e4715ce79a048455c0eec897b27237576564')
sha256sums_armv7h=('e8662d80d2cc9acc5f8f4d8a1c1a5ff7717b2fa71919a405d0eed8b64c8c1d88')

package() {
	#	use upx -d to allow namcap check the deps
	# upx -d rathole
	install -Dm755 rathole -t $pkgdir/usr/bin/rathole
}
