# Maintainer: Matthias Kurz <m.kurz@irregular.at>

pkgname=bombardier
pkgver=2.0.2
pkgrel=1
pkgdesc="Crossplatform HTTP benchmarking tool written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/codesenberg/bombardier"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("bombardier::git+https://github.com/codesenberg/$pkgname#tag=v$pkgver")
b2sums=('SKIP')

build() {
	cd "$pkgname"
	go build
}

package() {
	install -Dm755 "$pkgname"/"$pkgname" "$pkgdir/usr/bin/$pkgname"
}
