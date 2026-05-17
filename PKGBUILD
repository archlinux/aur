# Maintainer: Verdant <im@verdant.ee>
pkgname=kl
pkgver=0.0.1
pkgrel=1
pkgdesc="A lightweight, zero-dependency global keystroke monitoring and echoing tool written in pure C"
arch=('x86_64' 'aarch64')
url="https://github.com/yingyu5658/keyboard-listener"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('690736cfa5e76fb8162678ef38ffc86caafd6686207e5af02583d394664a098f')

build() {
    cd "keyboard-listener-${pkgver}"
    make
}

package() {
    cd "keyboard-listener-${pkgver}"
    install -Dm755 kl "${pkgdir}/usr/bin/kl"
}
