# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=dockeye
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="GUI app to manage Docker"
arch=('x86_64')
url="https://github.com/vv9k/dockeye"
license=('GPLv3')
depends=()
makedepends=('cargo' 'rust' 'libxcb' 'libxkbcommon')
provides=('dockeye')
conflicts=()
sha1sums=('SKIP')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
    cd $pkgname-$pkgver
    cargo build --release
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/dockeye" "$pkgdir/usr/bin/dockeye"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
