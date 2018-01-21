# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=aur-out-of-date
pkgver=0.4.0
pkgrel=2
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
sha256sums=('4932bb0357f9c6f211205de09ae511d5a709cf4a2eff885a53494966a616d7aa')
