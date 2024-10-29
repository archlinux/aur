# Maintainer: Bartosz Komosiński <contact@montidaproot.xyz>
# Contributor: YuLong Yao <feilongphone@gmail.com>

pkgname=devpod-bin
pkgver=0.5.21
pkgrel=4
pkgdesc="Codespaces but open-source, client-only, and unopinionated - unofficial package"
arch=('x86_64')
url="https://github.com/loft-sh/devpod"
license=('MPL-2.0')
provides=('devpod' 'devpod-cli')
depends=(
    'gdk-pixbuf2'
    'webkit2gtk'
    'cairo'
    'glib2'
    'gtk3'
    'pango'
    'hicolor-icon-theme'
    'gcc-libs'
    'libsoup'
    'glibc'
)
conflicts=('devpod')
options=('!strip')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/loft-sh/devpod/releases/download/v${pkgver}/DevPod_linux_x86_64.tar.gz"
)
sha256sums=('9ecb2a03e6bc7edaa17c48a8268949075a8416c1da030b5c40e1b6271579d44a')

package() {
    tar -xvf ${pkgname}-${pkgver}.tar.gz

    install -Dm755 "usr/bin/dev-pod" "${pkgdir}/usr/bin/dev-pod"
    install -Dm755 "usr/bin/devpod-cli" "${pkgdir}/usr/bin/devpod-cli"
    install -Dm755 "usr/share/applications/dev-pod.desktop" "${pkgdir}/usr/share/applications/dev-pod.desktop"
    install -Dm644 "usr/share/icons/hicolor/32x32/apps/dev-pod.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/dev-pod.png"
    install -Dm644 "usr/share/icons/hicolor/128x128/apps/dev-pod.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dev-pod.png"
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/dev-pod.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/dev-pod.png"
}
