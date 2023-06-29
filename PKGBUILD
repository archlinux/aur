# Maintainer: Cheems Bread <CheemsBread505@proton.me>
pkgname=neogo
pkgver=1.1.0
pkgrel=1
pkgdesc="neofetch but in golang"
arch=('x86_64')
url="https://github.com/CheemsBread505/neogo"
license=('GPL v3.0')
depends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/CheemsBread505/neogo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('15c40aeb628dcfd1df6e4356b672c1dec28e9bed261828329bff640328f3d247')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build -o "$pkgname"
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
