# Maintainer: Adam Thiede <me@adamthiede.com>
pkgname=reader
pkgver=0.4.4
pkgrel=1
pkgdesc="reader parses a web page for its actual content and displays it in nicely highlighted text on the command line."
url="https://github.com/mrusme/reader"
arch=(any)
license=("GPL-3.0")
makedepends=(go)

source=(
  ${url}/archive/refs/tags/v${pkgver}.tar.gz
)

build() {
	cd $pkgname-$pkgver
	go build
}

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

sha512sums=('9ccd76cbc615e6ba565579897c0e9dfb771434988706f1b5393a5b49cd70aac56dbeaa1a145b300d807cebd52d83c643e64468c9c1ee1f5fd323fc6dec4db51c')

