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

sha256sums=('403d5e681f460635de8a347ff878f4a0ffaaab577c7d0cea1710c853cb0fccd7')
