# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ncmdump
pkgver=1.2.1
pkgrel=1
pkgdesc="Convert Netease Cloud Music ncm files to mp3/flac files."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/taurusxin/${pkgname}"
license=("MIT")
depends=("glibc" "gcc-libs" "taglib" "zlib")
makedepends=("taglib")
provides=("${pkgname}"{,-latest-bin} )
conflicts=("${pkgname}"{,-latest-bin})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a1bd97fd1b46f9ba4ffaac0cf6cf1e920b49bf6ec753870ad0e6e07a72c2de2d')

build() {
    cd "${pkgname}-${pkgver}"
    rm -rf taglib
    make linux
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE*     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
