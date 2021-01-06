# Maintainer: Michael Zhang <mail@mzhang.io>

pkgname=leanshot
pkgver=0.4.1
pkgrel=1
pkgdesc='Screen capture for Linux.'
url='https://git.mzhang.io/michael/leanshot'
arch=('any')
license=('MIT')
depends=('rust' 'python3' 'libxcb' 'xcb-util-image')
source=("https://git.mzhang.io/michael/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d0bb027e2205d36c827fdc30ac3ca7a833526773a735f63c94f5ab6af716c587')

build() {
    cd "${pkgname}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${pkgname}"
    install -Dm 755 target/release/${pkgname} -t ${pkgdir}/usr/bin
}
