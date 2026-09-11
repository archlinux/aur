# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=mpv-music
pkgname=$_pkgname-bin
pkgver=0.28.0
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
sha256sums_x86_64=('0a3f4372ae6d3eb4dee80d4a948a989a000d07a5b4e899f10ba8a04e9eafbace')
sha256sums_aarch64=('72da16339feb0f20697ec5b325f2435c7e1b631625dcf2f5bddc594c5986dc4c')

package() {
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
