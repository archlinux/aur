# Maintainer: Bartosz Komosiński <contact@montidaproot.xyz>
# Contributor: YuLong Yao <feilongphone@gmail.com>

pkgname=devpod-bin
pkgver=0.6.0
pkgrel=2
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
    'libsoup'
    'glibc'
)
conflicts=('devpod')
options=('!strip')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/loft-sh/devpod/releases/download/v${pkgver}/DevPod_linux_x86_64.tar.gz"
)
sha256sums=('10b4791fd76f55b29781112c5688952d5c669c596bc7c66146df817b7711b39a')

package() {
    tar -xvf ${pkgname}-${pkgver}.tar.gz

    install -Dm755 "usr/bin/DevPod" "${pkgdir}/usr/bin/DevPod"
    install -Dm755 "usr/bin/devpod-cli" "${pkgdir}/usr/bin/devpod-cli"
    install -Dm755 "usr/share/applications/DevPod.desktop" "${pkgdir}/usr/share/applications/devpod.desktop"
    install -Dm644 "usr/share/icons/hicolor/32x32/apps/DevPod.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/devpod.png"
    install -Dm644 "usr/share/icons/hicolor/128x128/apps/DevPod.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/devpod.png"
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/DevPod.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/devpod.png"

}
