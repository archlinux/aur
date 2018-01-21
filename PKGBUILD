# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=aur-out-of-date
pkgver=0.5.0
pkgrel=1
pkgdesc="Determines out-of-date AUR packages"
arch=('x86_64' 'i686')
url="https://github.com/simon04/aur-out-of-date"
license=('GPL')
source=("https://github.com/simon04/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('git' 'go')

build() {
	cd "$pkgname-$pkgver"
  GOPATH="$srcdir" TMPDIR=/tmp go get -u github.com/simon04/aur-out-of-date/...
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$srcdir/bin/aur-out-of-date" "$pkgdir/usr/bin/aur-out-of-date"
}

sha256sums=('c256099cff5c1b7f4f779ac9ef18f2833b0a317045ba25f37889495f4443961f')
