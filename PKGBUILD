# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname=('rascii')
pkgver=0.4.2
pkgrel=1
pkgdesc='Advanced image to ASCII art tool & crate written in Rust crabrocket.'
arch=('x86_64')
license=('MIT')
url='https://github.com/KoBruhh/RASCII'
makedepends=('rust')


source=("git+${url}.git")

sha256sums=('SKIP')

build() {
    cd "${srcdir}/$(echo ${pkgname}|tr a-z A-Z)"
    cargo build --release
}

package() {
    install -Dm755 "${srcdir}/$(echo ${pkgname}|tr a-z A-Z)/target/release/${pkgname}" -t "${pkgdir}/usr/local/bin"
}
