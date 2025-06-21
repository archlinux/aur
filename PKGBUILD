pkgname=jfetch
pkgver=0.3
pkgrel=1
pkgdesc="A python-based, minimalist neofetch-like script packed as a binary."
arch=('x86_64')
url="https://github.com/blobbo7/jfetch"
license=('GPL')
makedepends=('python-pyinstaller')
source=("https://github.com/blobbo7/jfetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de92e1f2a273fcaae5e37fadb642f7b74d22f492fd490bcc722e7cf465aa437f')

build() {
  cd "$srcdir/jfetch-$pkgver"
  pyinstaller --onefile --add-data "ascii:ascii" jfetch
}

package() {
  install -Dm755 "$srcdir/jfetch-$pkgver/dist/jfetch" "$pkgdir/usr/bin/jfetch"
}
