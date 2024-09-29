# Maintainer: Bartosz Komosiński <contact@montidaproot.xyz>
# Contributor: YuLong Yao <feilongphone@gmail.com>

pkgname=devpod-bin
pkgver=0.5.21
pkgrel=1
pkgdesc="Codespaces but open-source, client-only, and unopinionated - unofficial package"
arch=('x86_64')
url="https://github.com/loft-sh/devpod"
license=('MPL-2.0')
depends=('fuse2')
conflicts=('devpod')
options=('!strip')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/loft-sh/devpod/releases/download/v${pkgver}/dev-pod-${pkgver}.tar.gz"
)
sha256sums=('660fa9ac1e21175851266a97f4f39341b83d62e2d572dfa6e92b0278003a065a')

package() {
    tar -xvf ${pkgname}-${pkgver}.tar.gz

    install -Dm755 "/usr/bin/dev-pod" "${pkgdir}/usr/bin/dev-pod"
    install -Dm755 "/usr/bin/devpod-cli" "${pkgdir}/usr/bin/devpod-cli"
    install -Dm755 "/usr/share/applications/dev-pod.desktop" "${pkgdir}/usr/share/applications/dev-pod.desktop"
    install -Dm644 "/usr/share/icons/hicolor/32x32/apps/dev-pod.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/dev-pod.png"
    install -Dm644 "/usr/share/icons/hicolor/128x128/apps/dev-pod.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dev-pod.png"
    install -Dm644 "/usr/share/icons/hicolor/256x256@2/apps/dev-pod.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/dev-pod.png"
}
