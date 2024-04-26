# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-bin
pkgver=0.3.0
pkgrel=2
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2')
depends=(
	avahi
	cuda
	ffmpeg
	gcc-libs
	glibc
	libpulse
	nvidia-utils
	openssl
	opus
)
provides=(moonshine)
conflicts=(moonshine)

source=(
	"https://github.com/hgaiser/moonshine/releases/download/v$pkgver/moonshine.tar.xz"
	"moonshine.service"
)
sha256sums=('18757655bf9704449a8e2123aeecd8d3c131f8f597bf7aa5cbe5934fa7d93514'
            'dc1d8e62f3a3d6b6af11f0c6418a29ba6889301e48d23b50d15cdde4f8e81099')

package() {
	cd "$srcdir"
	install -Dm755 moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm644 "$srcdir/moonshine.service" "$pkgdir/usr/lib/systemd/user/moonshine.service"
}
