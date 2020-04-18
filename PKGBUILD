# Maintainer: Louis Lefevre <louislefev@gmail.com>

pkgname=gnome-shell-theme-black-maia-git
pkgver=r33.6f99f66
pkgrel=2
pkgdesc="Black Maia, a dark theme for the GNOME Shell"
arch=('any')
url="https://github.com/bolimage/Black-Maia"
license=('LGPL3')
depends=('gnome-shell>=3.36')
makedepends=('git')
optdepends=('gnome-tweaks: Graphical interface for advanced GNOME 3 settings (Tweak Tool)')
source=("black-maia-theme::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd black-maia-theme
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    install -d "${pkgdir}/usr/share/themes"
    cp -r black-maia-theme "${pkgdir}/usr/share/themes/Black-Maia"
    find ${pkgdir} -type f -exec chmod 644 {} \;
    find ${pkgdir} -type d -exec chmod 755 {} \;
}
