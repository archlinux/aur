# Maintainer: lcian <lorenzo@cian.dev>
pkgname=logo-ls
pkgver=1.5.2
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
md5sums=('3d1d7d0ce9d7509f47d7c67d6e3358b3')

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
