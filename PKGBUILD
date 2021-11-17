# Maintainer: rustemb <rustemb@systemli.org>
pkgname=profetch
pkgver=0.1.7
pkgrel=2
pkgdesc="System Information Fetcher Written in GNU/Prolog "
arch=(any)
url="https://github.com/RustemB/profetch"
license=('GPL3')
depends=(glibc)
makedepends=(gprolog make)
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('04a956f878c0bc052e93a2d6d360651c')

build() {
    cd "$pkgname-$pkgver"
    make build
}

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" TARGET="./$pkgname"
    #install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
}
