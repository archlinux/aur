# Maintainer: Yamada Hayao <shun819.mail@gmail.com>

pkgname=inverse-icon-theme-blue-git
_pkgname=inverse-icon-theme
_gitname=Inverse-icon-theme
pkgver=r13.d6d1cb9
pkgrel=1
pkgdesc="A colorful Design icon theme for linux desktops"
arch=('any')
url='https://github.com/yeyushengfan258/Inverse-icon-theme'
license=('GPL')
depends=('gtk-update-icon-cache')
optdepends=()
source=("git+${url}.git")
md5sums=('SKIP')
conflicts=('inverse-icon-theme-blue')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}"
    cp -r * "${pkgdir}"
    cd "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share/icons"
    ${_gitname}/install.sh -blue -d "${pkgdir}/usr/share/icons"
    rm -rf "${pkgdir}/${_gitname}"
}
