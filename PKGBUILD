# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=mpv-music
pkgname=$_pkgname-bin
pkgver=0.27.1
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
sha256sums_x86_64=('7d1e32302ed61294d46b2e3ebbf2f4916a0ab353e9f7964c9f5f1e65266808f7')
sha256sums_aarch64=('ddf4082cbcfdc0b9d2fc7c20268e0f4a514a327c1833c8fcacee8ba35c07a072')

package() {
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
