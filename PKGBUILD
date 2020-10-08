# Maintainer: Nicolas KAROLAK <nicolas at karolak dot fr>

pkgname=devc
_pkgver=1.0.0-alpha.3
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A CLI tool to manage your devcontainers"
arch=('x86_64')
url="https://git.sr.ht/~nka/devc"
license=('GPL3')
depends=('docker')
optdepends=('docker-compose')
makedepends=(
	'make'
	'go'
)
source=("$pkgname-v$pkgver.tar.gz::https://git.sr.ht/~nka/$pkgname/archive/v$_pkgver.tar.gz")
sha256sums=("94cec2138684124385fabfbafda0f5aea33c4e6ba84522e7b7a855dc78764193")

build() {
	cd "$pkgname-v$_pkgver"
	make
}

package() {
	cd "$pkgname-v$_pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
