pkgname=mldy
pkgver=1.2
pkgrel=1
pkgdesc="Terminal UI for downloading videos using yt-dlp"
arch=('x86_64')
url="https://github.com/milkyicedtea/mldy"
license=('zlib')
depends=('go' 'yt-dlp' 'ffmpeg')
source=("https://github.com/milkyicedtea/mldy/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$srcdir/mldy-$pkgver"
  go build -o mldy
}

package() {
  cd "$srcdir/mldy-$pkgver"
  install -Dm755 mldy "$pkgdir/usr/bin/mldy"
}

sha256sums=('b80cbc1eff94f89577c6a0601cfa5827a8aa67b3bad7a4480ee10904a75864f6')
