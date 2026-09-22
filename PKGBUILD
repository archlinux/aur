# Maintainer: Francesc Elpeix
pkgname=rivulet-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A terminal RSS reader with 3-panel layout, categories, rich preview, and OPML support"
arch=('x86_64' 'aarch64')
url="https://github.com/elpeix/rivulet"
license=('GPL-3.0-only')
provides=('rivulet')
conflicts=('rivulet')

source_x86_64=("${url}/releases/download/v${pkgver}/rivulet-v${pkgver}-x86_64-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/rivulet-v${pkgver}-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('f59a5c28fb092539a0fac4796e72a2173a0648e60f0fb9cff542d7f636ae790c')
sha256sums_aarch64=('5192cd190557f0026f9f1117c96558487536f99a3971e347831126743a157d50')

package() {
    local _target="${CARCH}-linux-gnu"
    cd "rivulet-v${pkgver}-${_target}"
    install -Dm755 "rivulet" "${pkgdir}/usr/bin/rivulet"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
