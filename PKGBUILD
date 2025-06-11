# Maintainer: rahmed <rahmedyev@gmail.com>

pkgname=thinkfan-cli
pkgver=latest
pkgrel=1
pkgdesc="A lightweight tool for controlling ThinkPad Laptop's Fan"
url="https://github.com/rahmedi/thinkfan-cli"
license=('GPL3')
arch=('x86_64')
makedepends=('cargo' 'git')
source=("git+$url")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
