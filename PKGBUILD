# Maintainer: Francesc Elpeix
pkgname=rivulet-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A terminal RSS reader with 3-panel layout, categories, rich preview, and OPML support"
arch=('x86_64' 'aarch64')
url="https://github.com/elpeix/rivulet"
license=('GPL-3.0-only')
provides=('rivulet')
conflicts=('rivulet')

source_x86_64=("${url}/releases/download/v${pkgver}/rivulet-v${pkgver}-x86_64-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/rivulet-v${pkgver}-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('c37481dc2cf82c588c31ce0f90af1f65971bf049f04b54229a725f131e68f445')
sha256sums_aarch64=('3c21cd06786b61d1d6ecdf207dc6568dcae0ee945a668958654c7e12aad60ed2')

package() {
    local _target="${CARCH}-linux-gnu"
    cd "rivulet-v${pkgver}-${_target}"
    install -Dm755 "rivulet" "${pkgdir}/usr/bin/rivulet"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
