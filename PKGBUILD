# Maintainer: ljoonal <aur.lj at munally.com>

pkgname=vr-lighthouse-git
_pkgname=lighthouse
pkgver=1.3.0
pkgrel=1
pkgdesc="VR Lighthouse power state management in Rust"
arch=('x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
makedepends=('cargo')
source=("git+$url#tag=$pkgver")
b2sums=(
    'SKIP'
)

build() {
    cd $_pkgname
    cargo build --release
}

package() {
    install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
