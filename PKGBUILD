# Maintainer: lcian <lorenzo@cian.dev>
pkgname=logo-ls
pkgver=1.4.3
pkgrel=1
pkgdesc="ls, but with icons"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/canta2899/logo-ls"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go')

options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/canta2899/logo-ls/archive/v${pkgver}.tar.gz")
md5sums=('786699ba3ddb2aac0af8126e30eb4fe2')

prepare() {
    cd "$pkgname"-"$pkgver"
    go mod tidy
}

build() {
    cd "$pkgname"-"$pkgver"
    go build ./cmd/logo-ls
}

package() {
    cd "$pkgname"-"$pkgver"
    install -DT logo-ls $pkgdir/usr/bin/logo-ls
    install -DT LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
