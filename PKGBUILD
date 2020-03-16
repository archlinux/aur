# Maintainer: Yamada Hayao <shun819.mail@gmail.com>

pkgname=win10x-icon-theme-git
_pkgname=win10x-icon-theme
_gitname=Win10x-icon-theme
pkgver=r2.e79f634
pkgrel=1
pkgdesc="A colorful Design icon theme for linux desktops"
arch=('any')
url='https://github.com/yeyushengfan258/Win10x-icon-theme'
license=('GPL')
depends=('gtk-update-icon-cache')
optdepends=()
source=("git+${url}.git")
md5sums=('SKIP')
conflicts=('win10x-icon-theme')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}"
    cp -r * "${pkgdir}"
    cd "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share/icons"
    ${_gitname}/install.sh -d "${pkgdir}/usr/share/icons"
    rm -rf "${pkgdir}/${_gitname}"
}
