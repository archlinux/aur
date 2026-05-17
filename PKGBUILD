# Maintainer: Verdant <im@verdant.ee>
pkgname=kl
pkgver=0.0.2
pkgrel=1
pkgdesc="A lightweight, zero-dependency global keystroke monitoring and echoing tool written in pure C"
arch=('x86_64' 'aarch64')
url="https://github.com/yingyu5658/keyboard-listener"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('23d3de433f4c417549d724ce603cf7e030e3326ac02b8d66f558e36bb51a08d6')

build() {
    cd "keyboard-listener-${pkgver}"
    make
}

package() {
    cd "keyboard-listener-${pkgver}"
    install -Dm755 kl "${pkgdir}/usr/bin/kl"
}
