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

source=("$pkgname-v$pkgver.tar.gz::https://github.com/nikaro/$pkgname/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=("7f486bb847157eeea799ff5581e6f0dd0078d540745c1f10911ba79ff7880fff")

build() {
	cd "$pkgname-v$_pkgver"
	make
}

package() {
	cd "$pkgname-v$_pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
