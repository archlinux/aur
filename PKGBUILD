# Maintainer: maribotto <maribotto@users.noreply.github.com>
pkgname=curlent
pkgver=1.0.0
pkgrel=1
pkgdesc="A wget-like command-line torrent downloader using libtorrent"
arch=('x86_64')
url="https://github.com/maribotto/curlent"
license=('MIT')
depends=('libtorrent-rasterbar' 'boost-libs')
makedepends=('boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maribotto/curlent/archive/v$pkgver.tar.gz")
sha256sums=('b77d89c488986583b339d7b2c03045c4435534f19c5c0d6b823693fa9d47d72e')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
