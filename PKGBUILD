
# Maintainer: Your Name <restapi260@gmail.com>
pkgname=gofetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A neofetch inspired utility written in golang"
arch=("x86_64")
url="https://github.com/grMLEqomlkkU5Eeinz4brIrOVCUCkJuN/gofetch"
license=('MIT')
depends=()
makedepends=("go" "git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/grMLEqomlkkU5Eeinz4brIrOVCUCkJuN/gofetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("be13068fca900ea2a59aabec7d6e9921313ad70a6d8a3ef74eb362152641705e")

build() {
	cd "$pkgname-$pkgver"
	go build -trimpath -ldflags="-s -w" -o gofetch ./cmd/gofetch
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 gofetch "$pkgdir/usr/bin/gofetch"
}
