# Maintainer: Kushagra Sharma <tda@thedarkartist.in>
pkgname=ipclip
pkgver=1.0.0
pkgrel=1
pkgdesc="A Rust program to copy the local IP address to the clipboard using shell commands."
arch=('x86_64')
url="https://github.com/TheDarkArtist/ipclip"
license=('MIT')
depends=('xclip')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TheDarkArtist/ipclip/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}

