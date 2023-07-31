# Maintainer: Adam Thiede <me@adamthiede.com>
pkgname=reader
pkgver=0.4.2
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

sha512sums=('d7251d0233c1ea349473e681563bbe2614ce17df7356dd326d9f52a09ecc307106a92d033bd3021bc4192d153de50858d3901ba3ab782c6a6d39b352cb7b811a')

