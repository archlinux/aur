# Maintainer: MaloLeNono malo.gabriel.2@gmail.com
pkgname=dontdoas
pkgver=1.0.0
pkgrel=1
pkgdesc='Does not execute your command'
arch=('x86_64')
url='https://github.com/malolenono/dontdoas'
license=('MIT')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/malolenono/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('86c613b7e44204f0e219e9e49847471054f1be6582355f39a88ee35b9fc05b8b')

build() {
    cd "$pkgname-$pkgver"
    gcc -O2 -o dontdoas main.c
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 dontdoas -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
