# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>

pkgname=scip
pkgver=1.0.0
pkgrel=1
pkgdesc="Serial Console Interfacing Program"
arch=('x86_64')
url="https://gitlab.com/w0lff/scip"
license=('MIT')
makedepends=('rust' 'git')
source=("$pkgname-v$pkgver.tar.gz::https://gitlab.com/w0lff/scip/-/archive/v${pkgver}/scip-v${pkgver}.tar.gz")
sha256sums=('cc55b9da23b5eef01d06cadc295ef3543e67378f2f4206df3f06d9841afa3e7a')

build() {
    cd $pkgname-v$pkgver
    cargo build --locked --release
}

package() {
    cd $pkgname-v$pkgver
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/scip"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
