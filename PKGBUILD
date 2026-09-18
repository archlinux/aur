# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=mpv-music
pkgname=$_pkgname-bin
pkgver=0.29.0
pkgrel=1
pkgdesc='Blazing-fast, terminal-native music player and library browser for mpv (prebuilt, static musl)'
arch=(x86_64 aarch64)
url='https://github.com/FurqanHun/mpv-music'
license=(MIT)
depends=('mpv')
optdepends=('yt-dlp: for playing URLs'
            'deno: JS runtime for YouTube playback (recommended)'
            'nodejs: alternative JS runtime for YouTube playback')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/FurqanHun/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('a45fa2598cba03440691efa1ea743252a7651963808921e5627f7845696a0689')
sha256sums_x86_64=('b34a07bc489cc28918fbba77a74705436237b97c0a4a2f35f8cb96ad261a09d3')
sha256sums_aarch64=('4d0e3e73e9b56b918bf493ab3b90763f2a738fab7ad8ef99da0699ae996ca290')

package() {
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
