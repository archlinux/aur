# Maintainer: Seraphim Pardee <me at srp dot life>
pkgname=rlshim
pkgver=1.6.0
pkgrel=1
pkgdesc="A lightweight, native Linux launcher for RuneLite."
arch=('x86_64' 'aarch64')
url="https://github.com/RdrSeraphim/rlshim"
license=('BSD-2-Clause')
depends=('libsecret' 'gcc-libs' 'glibc' 'java-runtime>=11')
makedepends=('cargo' 'make' 'pkgconf' 'curl')
provides=('rlshim')
conflicts=('rlshim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RdrSeraphim/rlshim/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('53396f9ae845c2051074280fc401d3cf520c334410f59b97835eac58355594e7')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" PREFIX=/usr make install
}
