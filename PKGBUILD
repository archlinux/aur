# Maintainer: Nakidai <nakidai at disroot dot org>
pkgname=througha
pkgdesc="Run commands through a proxy"
url="https://github.com/nakidai/througha"
license=("0BSD")

pkgver=1.0.0
pkgrel=1

arch=("x86_64")
depends=("glibc")
makedepends=("gcc")

source=("$pkgname-$pkgver::https://github.com/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('70f134e62af012892948558d3bbbf2afbbd75fe415b3945864afc3238c0531ab')

build() {
    cd "$pkgname-$pkgver"
    make clean all
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
