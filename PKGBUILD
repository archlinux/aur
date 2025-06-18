# Maintainer: Bartosz Komosiński <contact@montidaproot.xyz>
# Contributor: YuLong Yao <feilongphone@gmail.com>

pkgname=devpod-bin
pkgver=0.6.15
pkgrel=3
pkgdesc="Codespaces but open-source, client-only, and unopinionated - unofficial package"
arch=('x86_64')
url="https://github.com/loft-sh/devpod"
license=('MPL-2.0')
provides=('devpod' 'devpod-cli')
depends=(
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'cairo'
    'glib2'
    'gtk3'
    'pango'
    'hicolor-icon-theme'
    'gcc-libs'
    'libsoup3'
    'glibc'
    'libayatana-appindicator'
)
conflicts=('devpod' 'devpod-cli-bin')
options=('!strip')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/loft-sh/devpod/releases/download/v${pkgver}/DevPod_linux_x86_64.tar.gz"
)
sha256sums=('6c5bd63326f92a45707604970d70f6a8cc2c5ffffe703e0903a0c3ded4c042ab')

package() {
    tar -xvf ${pkgname}-${pkgver}.tar.gz

    install -Dm755 "usr/bin/dev-pod-desktop" "${pkgdir}/usr/bin/dev-pod-desktop"
    install -Dm755 "usr/bin/devpod-cli" "${pkgdir}/usr/bin/devpod-cli"
    install -Dm755 "usr/share/applications/DevPod.desktop" "${pkgdir}/usr/share/applications/DevPod.desktop"
    install -Dm644 "usr/share/icons/hicolor/32x32/apps/dev-pod-desktop.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/dev-pod-desktop.png"
    install -Dm644 "usr/share/icons/hicolor/128x128/apps/dev-pod-desktop.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dev-pod-desktop.png"
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/dev-pod-desktop.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/dev-pod-desktop.png"

}
