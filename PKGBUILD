# Maintainer: Yamada Hayao <shun819.mail@gmail.com>

pkgname=citrus-icon-theme-git
_pkgname=citrus-icon-theme
_gitname=Citrus-icon-theme
pkgver=r48.f9a91e6
pkgrel=1
pkgdesc="A colorful Design icon theme for linux desktops"
arch=('any')
url='https://github.com/yeyushengfan258/Citrus-icon-theme'
license=('GPL')
depends=('gtk-update-icon-cache')
optdepends=()
source=("git+${url}.git")
md5sums=('SKIP')
conflicts=('citrua-icon-theme')

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
