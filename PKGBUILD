pkgname=mldy
pkgver=1.2
pkgrel=1
pkgdesc="Terminal UI for downloading videos using yt-dlp"
arch=('x86_64')
url="https://github.com/milkyicedtea/mldy"
license=('zlib')
depends=('yt-dlp' 'ffmpeg')
makedepends=('go')
source=("https://github.com/milkyicedtea/mldy/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$srcdir/mldy-$pkgver"
  go build -o mldy
}

package() {
  cd "$srcdir/mldy-$pkgver"
  install -Dm755 mldy "$pkgdir/usr/bin/mldy"
}

sha256sums=('34ef161343b683fd0b011879d400ac1f901b5e338f0f2c84685b9f3aff0028b6')
