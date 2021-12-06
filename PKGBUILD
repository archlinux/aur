# Maintainer: Nicolas KAROLAK <nicolas at karolak dot fr>

pkgname=devc
_pkgver=1.0.0-alpha.4
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A CLI tool to manage your devcontainers"
arch=('x86_64')
url="https://github.com/nikaro/devc"
license=('GPL3')
depends=('docker')
optdepends=('docker-compose')
makedepends=(
	'make'
	'go'
)
provides=('devc')
conflicts=('devc')

source=("$pkgname-v$pkgver.tar.gz::https://github.com/nikaro/$pkgname/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=("16e4ab7d9b4f445892745905a32d3b8f50b909b3a95f0c0af81c4e5e40e08b81")

build() {
	cd "$srcdir/$pkgname-v$_pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-v$_pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
