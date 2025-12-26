# Maintainer: AmarBego <begovicamar@proton.me>
pkgname=gittop-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A lightweight GitHub notifications client. Why spin up a browser just to check your GitHub notifications?"
arch=('x86_64')
url="https://github.com/AmarBego/GitTop"
license=('AGPL-3.0-only')
provides=('gittop')
conflicts=('gittop')
depends=('gcc-libs' 'gtk3' 'xdotool' 'libappindicator-gtk3')
options=('!strip' '!debug')
install=gittop.install
source=("gittop-linux-x86_64-${pkgver}.tar.gz::https://github.com/AmarBego/GitTop/releases/download/v${pkgver}/gittop-linux-x86_64.tar.gz")
sha256sums=('53d999c813dea4ce79ee05e1c643cbfa01ac3050b0633e43bcb863dfdf69e23a')

package() {
    cd "${srcdir}/gittop-linux-x86_64"
    install -Dm755 "gittop" "${pkgdir}/usr/bin/gittop"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
    install -Dm644 "gittop.desktop" "${pkgdir}/usr/share/applications/gittop.desktop"
    install -Dm644 "gittop.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gittop.png"
    install -Dm644 "gittop.png" "${pkgdir}/usr/share/pixmaps/gittop.png"
}
