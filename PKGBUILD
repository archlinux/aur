pkgname=tinytaptunnel
pkgver=1.4
pkgrel=1
pkgdesc="creates a point-to-point layer 2 tunnel over UDP/IP"
arch=(x86_64)
url="https://github.com/vsergeev/tinytaptunnel"
license=('MIT')
depends=()
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/vsergeev/tinytaptunnel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2cdf26f28e64db5cd0e669881963189d45dd45fbc8fba0c241f69959d62986c0')

build() {
	cd "$pkgname-$pkgver"
	go mod init github.com/vsergeev/tinytaptunnel
	go mod tidy
	go build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 tinytaptunnel "$pkgdir"/usr/bin/tinytaptunnel
}
