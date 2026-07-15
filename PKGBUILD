# Maintainer: MaloLeNono malo.gabriel.2@gmail.com
pkgname=dontdoas
pkgver=1.2.0
pkgrel=1
pkgdesc='Does not execute your command'
arch=('x86_64')
url='https://github.com/malolenono/dontdoas'
license=('MIT')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/malolenono/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9ab95c25d3275614777412b03fdeee1e1b73739853a502bd6a6ecb997ea9cc1d')

build() {
    cd "$pkgname-$pkgver"
    gcc -O2 -o dontdoas main.c
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 dontdoas -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
