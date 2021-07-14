# Maintainer: Michael Zhang <mail@mzhang.io>

pkgname=leanshot
pkgver=0.5.0
pkgrel=1
pkgdesc='Screen capture for Linux.'
url='https://git.mzhang.io/michael/leanshot'
arch=('any')
license=('MIT')
makedepends=('python3')
depends=('rust' 'libxcb' 'xcb-util-image')
source=("leanshot-v${pkgver}.tar.gz::https://git.mzhang.io/michael/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9883649c13e61ac93b45daf29227bda959566c004fd4f65aef8139e7d6050986')

build() {
    cd "${pkgname}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${pkgname}"
    install -Dm 755 target/release/${pkgname} -t ${pkgdir}/usr/bin
}
