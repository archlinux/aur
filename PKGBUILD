# Maintainer: Nicolas KAROLAK <nicolas at karolak dot fr>

pkgname=devc
_pkgver=1.0.0-alpha.3
pkgver=${_pkgver//-/.}
pkgrel=2
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

source=("$pkgname-v$pkgver.tar.gz::https://github.com/nikaro/releases/download/v$_pkgver/${pkgname}_${_pkgver}_Linux_x86_64.tar.gz")
sha256sums=("836e46df8f4ec1b28e66139a35e228aa08247501d653a6977390894b6966f144")

build() {
	cd "$pkgname-v$_pkgver"
	make
}

package() {
	cd "$pkgname-v$_pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
