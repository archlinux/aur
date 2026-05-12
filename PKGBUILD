# Maintainer: czyt <czytcn@gmail.com>
pkgname=tunnix-bin
pkgver=0.2.1
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
sha256sums_x86_64=('bd997605f911c37406e851a026f524fcb302b9d87f6faf6391cb2aa95347342f')

prepare() {
    cd "${srcdir}"
    unzip -o "tunnix_linux_x86_64_v${pkgver}.zip"
}

package() {
    cd "${srcdir}"
    install -Dm755 tunnix "${pkgdir}/usr/bin/tunnix"
}
