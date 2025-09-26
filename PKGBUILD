# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=hyprland-plugin-easymotion
pkgver=0.51.1
pkgrel=1
pkgdesc="A single dispatcher that brings up window labels and then allows you to execute a user-defined command when one of those labels is typed"
arch=('x86_64')
url="https://github.com/zakk4223/hyprland-easymotion"
license=('BSD')
source=(${pkgname}::git+https://github.com/zakk4223/hyprland-easymotion.git#commit=c7b12e4a8df83b0445799ffbecd64c3f20adb393)
sha512sums=('SKIP')
depends=("hyprland=${pkgver}")
makedepends=('git' 'hyprland')
options=(!debug)

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 hypreasymotion.so "$pkgdir/usr/lib/hypreasymotion.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-easymotion/LICENSE"
}

