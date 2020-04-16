# Maintainer: Batuhan Baserdem <lastn.firstn[at]gmail>
name=breeze-hacked-cursor-theme
pkgname="${name}-git"
pkgver=2.0
pkgrel=4
pkgdesc="Breeze Hacked cursor theme"
arch=("any")
url="https://github.com/codejamninja/${name}"
license=("GPL")
makedepends=("gnome-themes-extra" "inkscape" "xorg-xcursorgen")
provides=("${name}")
conflicts=("${name}")
source=("git+${url}")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${name}"
    make build
}

package() {
    install -dm 0755 "${pkgdir}/usr/share/icons"
    cp -rf "${srcdir}/${name}/Breeze_Hacked" "${pkgdir}/usr/share/icons"
    chmod -R u=rwX,g=rX,o=rX "${pkgdir}/usr/share/icons/Breeze_Hacked"
}
