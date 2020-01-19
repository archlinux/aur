# Maintainer: Peter Roberts <me@peter-r.co.uk>
pkgname=go-zoom-bin
provides=("go-zoom")
pkgver=0.1.3
pkgrel=1
pkgdesc="Parallel command executor with a focus on simplicity and good cross-platform behaviour."
arch=("x86_64")
url="https://github.com/pwr22/go-zoom"
_rawurl="https://raw.githubusercontent.com/pwr22/go-zoom"
license=('MIT')
depends=("glibc")
source=("$url/releases/download/v$pkgver/go-zoom-linux-amd64")
sha256sums=("cc4b7a18dd21d416a11cd36e168fcadbded634c8b9d9239a804d2186463cfa0e")

# Go stuff based on https://wiki.archlinux.org/index.php/Go_package_guidelines

prepare(){
  curl -o "LICENSE" "$_rawurl/v$pkgver/LICENSE"
}

package() {
	install -Dm755 "go-zoom-linux-amd64" "$pkgdir/usr/bin/go-zoom"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
