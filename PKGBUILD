pkgname=goanime
pkgver=1.0.4
pkgrel=1
pkgdesc="A command-line tool to browse, play, and download anime."
arch=('x86_64')
url="https://github.com/alvarorichard/GoAnime"
license=('MIT')
depends=('go' 'mpv' 'yt-dlp')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alvarorichard/GoAnime/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/GoAnime-1.0.4"
}

build() {
	cd "$srcdir/GoAnime-1.0.4"
	GOOS=linux GOARCH=amd64 go build -o goanime .
}

package() {
	cd "$srcdir/GoAnime-1.0.4"
	install -Dm755 goanime "$pkgdir/usr/bin/goanime"
}
