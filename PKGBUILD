# Maintainer: scan

pkgname=gnome-shell-theme-black-maia-git
pkgver=r16.0b0c328
pkgrel=1
pkgdesc="Black Maia GNOME Shell Theme for GNOME 3.28"
arch=("any")
url="https://github.com/bolimage/Black-Maia"
license=("GPL")
depends=("gnome-shell>3.28")
makedepends=("git")
optdepends=("gnome-tweak-tool: A tool to customize advanced GNOME 3 options.")
source=("black-maia-theme::git+https://github.com/bolimage/Black-Maia")
sha256sums=("SKIP")

pkgver() {
    cd black-maia-theme
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/usr/share/themes
    cp -r black-maia-theme $pkgdir/usr/share/themes/Black-Maia
    find ${pkgdir} -type f -exec chmod 644 {} \;
    find ${pkgdir} -type d -exec chmod 755 {} \;
}
