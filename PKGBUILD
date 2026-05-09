# Maintainer: AmarBego <begovicamar@proton.me>
pkgname=gittop-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A lightweight GitHub notifications client. Why spin up a browser just to check your GitHub notifications?"
arch=('x86_64' 'aarch64')
url="https://github.com/AmarBego/GitTop"
license=('AGPL-3.0-only')
provides=('gittop')
conflicts=('gittop')
depends=('gcc-libs')
options=('!strip' '!debug')
install=gittop.install
source_x86_64=("gittop-${pkgver}-linux-gnu-x86_64.tar.gz::https://github.com/AmarBego/GitTop/releases/download/v${pkgver}/gittop-${pkgver}-linux-gnu-x86_64.tar.gz")
source_aarch64=("gittop-${pkgver}-linux-gnu-aarch64.tar.gz::https://github.com/AmarBego/GitTop/releases/download/v${pkgver}/gittop-${pkgver}-linux-gnu-aarch64.tar.gz")
sha256sums_x86_64=('79813785ca2d713e931614a8d605c06a5de0764a883c55efeb2bf5ca003e6401')
sha256sums_aarch64=('6188a099153a59dd8bf34363157df6a363c7d5b85aafa8f3c53f977979e30aed')

package() {
    cd "${srcdir}/gittop-${pkgver}-linux-gnu-${CARCH}"
    install -Dm755 "gittop" "${pkgdir}/usr/bin/gittop"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
    install -Dm644 "gittop.desktop" "${pkgdir}/usr/share/applications/gittop.desktop"
    install -Dm644 "gittop.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gittop.png"
    install -Dm644 "gittop.png" "${pkgdir}/usr/share/pixmaps/gittop.png"
}
