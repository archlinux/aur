# Maintainer: Stephen E. Baker <baker.stephen.e@gmail.com>

pkgname=pacpreview
pkgver=0.5.0
pkgrel=2
makedepends=('rust' 'cargo')
optdepends=('fzf: use as a search tool')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="Pacman package info viewer, intended for use with fzf --preview"
license=('GPL3')
url='https://github.com/TheCycoONE/pacpreview'
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheCycoONE/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('29b9e25913459903692050a2299a74d6565335ffe23ea1948264ea3bb7e90f2a')

build() {
    cd "$pkgname-$pkgver"

    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
