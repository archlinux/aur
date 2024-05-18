# Maintainer: kormpu mcgpapu@gmail.com 
# Contributor: silverbluep baserdem.batuhan@gmail.com
# Contributor: dctxmei dctxmei@gmail.com
# tested against namcap and clean chroot using extra-x86_64-build

_name=breeze-hacked-cursor-theme
pkgname="${_name}-git"
pkgver=r20.79dcc89
pkgrel=1
pkgdesc="Breeze Hacked cursor theme"
arch=("any")
url="https://github.com/clayrisser/breeze-hacked-cursor-theme.git"
license=("GPL-2.0-only")
makedepends=('gnome-themes-extra' 'inkscape' 'xorg-xcursorgen' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+${url}")
b2sums=('SKIP')
epoch=1


build() {
    cd "${srcdir}/${_name}"
    make build
}

package() {
    install -dm 0755 "${pkgdir}/usr/share/icons"
    cp -rf "${srcdir}/${_name}/Breeze_Hacked" "${pkgdir}/usr/share/icons"
    chmod -R u=rwX,g=rX,o=rX "${pkgdir}/usr/share/icons/Breeze_Hacked"
}

pkgver() {
	cd "$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
