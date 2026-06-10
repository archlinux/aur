# Maintainer: Aude <audesinthe@gmail.com>
pkgname=meowl-pet-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Linux desktop pet that counts the words you type, sits in the bottom-right corner above all windows"
arch=('x86_64')
url="https://github.com/Meowrrr70/meowl-pet"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('xorg-xwayland: required for Wayland sessions (XWayland mode)')
provides=('meowl-pet')
conflicts=('meowl-pet')
install=meowl-pet.install
source=(
    "meowl-pet-${pkgver}-linux::https://github.com/Meowrrr70/meowl-pet/releases/download/${pkgver}/meowl-pet-${pkgver}-linux"
    "meowl-pet.service"
    "meowl-pet.install"
)
sha256sums=(
    'f5bae8fc15205e9dc881c7c3daf7acdcbc17bc710c1e6cefcce2d812e7889276'
    '73c2e8808256b71e68348697517460279ea6c6ef8f72f7a6eb951d46eada23b8'
    '41b4c18f5b2deb61e3d6405ebf893423131374d2af14ceb2d1282e0c48acf442'
)

package() {
    install -Dm755 "${srcdir}/meowl-pet-${pkgver}-linux" "${pkgdir}/usr/bin/meowl-pet"
    install -Dm644 "${srcdir}/meowl-pet.service" \
        "${pkgdir}/usr/lib/systemd/user/meowl-pet.service"
}
