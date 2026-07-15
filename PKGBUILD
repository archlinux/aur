# Maintainer: MaloLeNono malo.gabriel.2@gmail.com
pkgname=dontdoas
pkgver=1.1.0
pkgrel=1
pkgdesc='Does not execute your command'
arch=('x86_64')
url='https://github.com/malolenono/dontdoas'
license=('MIT')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/malolenono/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('232b2a7b6542bee4d1e637faf2afdccfbdd874a1e70b5ede09e8e6c2cfe368cd')

build() {
    cd "$pkgname-$pkgver"
    gcc -O2 -o dontdoas main.c
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 dontdoas -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
