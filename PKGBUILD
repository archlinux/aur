# Maintainer: Estela ad Astra <i at estela dot cn>

pkgname=sm3sum
pkgver=0.1
pkgrel=1
pkgdesc="SM3 hash checksum."
arch=('i686' 'x86_64' 'aarch64' 'riscv64')
url="https://github.com/saeziae/sm3sum"
license=('MIT')
makedepends=('rust')
source=("https://github.com/saeziae/sm3sum/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c52536c72ac2a0363a8d4cb9789288b5eaedb80fc3fc0110418695c0d7a3fcb6')
_srcname=$pkgname-$pkgver

build() {
    cd ${_srcname}
    cargo build --release
}

package() {
    install -Dm755 "${srcdir}/${_srcname}/target/release/sm3sum" "${pkgdir}/usr/bin/sm3sum"
}
