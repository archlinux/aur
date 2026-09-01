# Maintainer: Francesc Elpeix
pkgname=rivulet-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="A terminal RSS reader with 3-panel layout, categories, rich preview, and OPML support"
arch=('x86_64' 'aarch64')
url="https://github.com/elpeix/rivulet"
license=('GPL-3.0-only')
provides=('rivulet')
conflicts=('rivulet')

source_x86_64=("${url}/releases/download/v${pkgver}/rivulet-v${pkgver}-x86_64-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/rivulet-v${pkgver}-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('8d8259edbf43f2fda0d3a4a2729b19c5cdf9a489b96d70a5b0e7ba4c2be8ddc9')
sha256sums_aarch64=('a92602a809da6b55c078c46eea90aeece8ccfbf69d1bd35a117720e6b4b6572f')

package() {
    local _target="${CARCH}-linux-gnu"
    cd "rivulet-v${pkgver}-${_target}"
    install -Dm755 "rivulet" "${pkgdir}/usr/bin/rivulet"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
