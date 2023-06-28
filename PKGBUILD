# Maintainer: Cheems Bread <CheemsBread505@proton.me>
pkgname=neogo
pkgver=1.0.1
pkgrel=1
pkgdesc="neofetch but in golang"
arch=('x86_64')
url="https://github.com/CheemsBread505/neogo"
license=('GPL v3.0')
depends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/CheemsBread505/neogo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8f66e6aad6b40578daba3359e2e2bda21ddd20db03c0a16df135dbba09ff2fe')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build -o "$pkgname"
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
