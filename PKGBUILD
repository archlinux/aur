# Maintainer: MaloLeNono malo.gabriel.2@gmail.com
pkgname=dontdoas
pkgver=1.3.0
pkgrel=1
pkgdesc='Does not execute your command'
arch=('x86_64')
url='https://github.com/malolenono/dontdoas'
license=('MIT')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/malolenono/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a6fe391a4214f048ea8812d69ec176c8950b1782e107ec40897b8e29e8b32136')

build() {
    cd "$pkgname-$pkgver"
    gcc -O2 -o dontdoas main.c callbacks.c
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 dontdoas -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
