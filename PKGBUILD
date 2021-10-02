# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=epick
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="Color picker for creating harmonic color palettes"
arch=('x86_64')
url="https://github.com/vv9k/epick"
license=('GPLv3')
depends=()
makedepends=('cargo' 'rust')
provides=('epick')
conflicts=()
sha1sums=('SKIP')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
    cd $pkgname-$pkgver
    cargo build --release
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/epick" "$pkgdir/usr/bin/epick"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
