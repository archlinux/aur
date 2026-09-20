# Maintainer: czyt <czytcn@gmail.com>
pkgname=tunnix-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="An encrypted SOCKS5/HTTP proxy tunnel over HTTP/SSE"
arch=('x86_64')
url="https://github.com/aeroxy/tunnix"
license=('MIT')
depends=('glibc')
makedepends=('unzip')
provides=('tunnix')
conflicts=('tunnix')

source_x86_64=("tunnix_linux_x86_64_v${pkgver}.zip::https://github.com/aeroxy/tunnix/releases/download/${pkgver}/tunnix_linux_x86_64.zip")
sha256sums_x86_64=('f9d266d227e1c7a9f9b8bd3d6a3eeedba9d09e7282f8c1a7ca93a4887c09972a')

prepare() {
    cd "${srcdir}"
    unzip -o "tunnix_linux_x86_64_v${pkgver}.zip"
}

package() {
    cd "${srcdir}"
    install -Dm755 tunnix "${pkgdir}/usr/bin/tunnix"
}
