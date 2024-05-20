# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
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
	"https://github.com/hgaiser/moonshine/releases/download/v$pkgver/moonshine-v$pkgver-linux-amd64.tar.xz"
	"moonshine.service"
)
sha256sums=('e69e3150e8f6d102c6b2d160f222f4b29e450d8ffe3f945c61e4ddbb24ae0479'
            'dc1d8e62f3a3d6b6af11f0c6418a29ba6889301e48d23b50d15cdde4f8e81099')

package() {
	install -Dm755 "$srcdir/v$pkgver/moonshine" "$pkgdir/usr/bin/moonshine"
	install -Dm755 "$srcdir/v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/moonshine.service" "$pkgdir/usr/lib/systemd/user/moonshine.service"
}
