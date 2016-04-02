# Maintainer: barcia <barcia@opmbx.org>

_gitname=Antu
#_pkgname=Antu
_theme="Antu*Plasma*Theme"
_colorscheme="Color*Schemes"
_decorations="Decorations/Kwin"
_wallpapers="Wallpapers"
pkgname=('antu-plasma-theme-git')
pkgver=r103.edf89e7
pkgrel=1
pkgdesc="A theme for Plasma Desktop"
arch=('any')
url="https://github.com/fabianalexisinostroza/${_gitname}"
license=('GPL3')
options=('!strip')
conflicts=('')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # Plasma theme
    install -d ${pkgdir}/usr/share/plasma/desktoptheme/antu
    install -d ${pkgdir}/usr/share/plasma/desktoptheme/antu-flat
    cp -r ${srcdir}/${_gitname}/${_theme}/antu/* ${pkgdir}/usr/share/plasma/desktoptheme/antu
    cp -r ${srcdir}/${_gitname}/${_theme}/antu-flat/* ${pkgdir}/usr/share/plasma/desktoptheme/antu-flat

    # Window decorations
    install -d ${pkgdir}/usr/share/kwin/decorations
    cp -r ${srcdir}/${_gitname}/${_decorations}/* ${pkgdir}/usr/share/kwin/decorations

    # Color Scheme
    install -d ${pkgdir}/usr/share/color-schemes
    cp -r ${srcdir}/${_gitname}/${_colorscheme}/* ${pkgdir}/usr/share/color-schemes

    # Wallpapers
    install -d ${pkgdir}/usr/share/wallpapers
    cp -r ${srcdir}/${_gitname}/${_wallpapers}/* ${pkgdir}/usr/share/wallpapers
}
