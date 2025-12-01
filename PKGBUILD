# Maintainer: BonnyAD9 (Bonny4)
pkgname=uamp
pkgver=0.6.6
pkgrel=1
pkgdesc="Universal Advanced Music Player written in rust."
arch=(x86_64)
url="https://bonnyad9.github.io/uamp/"
license=('GPL-3.0-or-later')
depends=(gcc-libs alsa-lib glibc hicolor-icon-theme)
makedepends=(cargo)
optdepends=()
provides=()
source=("https://github.com/BonnyAD9/uamp/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')
options=('!debug')

build() {
    cd "uamp-$pkgver"
    cargo build --features no-self-update -r
}

package() {
    cd "uamp-$pkgver"
    
    target/release/uamp internal install --root "$pkgdir"
}
