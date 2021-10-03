# Maintainer: Yamada Hayao <hayao@fascode.net>

pkgname=win11-icon-theme-git
_pkgname=win11-icon-theme
_gitname=win11-icon-theme
pkgver=r88.2293237
pkgrel=1
pkgdesc="A colorful Design icon theme for linux desktops"
arch=('any')
url='https://github.com/yeyushengfan258/win11-icon-theme'
license=('GPL')
depends=('gtk-update-icon-cache')
optdepends=()
source=("git+${url}.git")
md5sums=('SKIP')
conflicts=('win11-icon-theme')

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    "${srcdir}/${_gitname}/install.sh" -a -d "${pkgdir}/usr/share/icons"
}
