# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: s-adi-dev <adi@s-adi.dev>

pkgname=hyprshot-gui
pkgver=r19.2f37759
pkgrel=1
pkgdesc="A simple GTK-based GUI for Hyprshot, designed to provide an easy way to capture and manage screenshots on Hyprland."
arch=('any')
url="https://github.com/s-adi-dev/hyprshot-gui"
license=('MIT')
depends=('hyprshot' 'gtk4' 'python-gobject')
makedepends=('git')
provides=("${pkgname}")

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 "src/hyprshot-gui" "${pkgdir}/usr/bin/hyprshot-gui"
    install -Dm644 "src/hyprshot.desktop" "${pkgdir}/usr/share/applications/hyprshot.desktop"
}
