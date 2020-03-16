# Maintainer: Yamada Hayao <shun819.mail@gmail.com>
# Contributor: YamaD <yamad.linuxer@gmail.com>

pkgname=tencent-icon-theme-git
_pkgname=tencent-icon-theme
_gitname=Tencent-icon-theme
pkgver=r7.8531bf6
pkgrel=1
pkgdesc="A colorful Design icon theme for linux desktops"
arch=('any')
url='https://github.com/yeyushengfan258/Tencent-icon-theme'
license=('GPL')
depends=('gtk-update-icon-cache')
optdepends=()
source=("git+${url}.git")
md5sums=('SKIP')
conflicts=('tencent-icon-theme')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}"
    cp -r * "${pkgdir}"
    cd "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share/icons"
    ${_gitname}/install.sh -a -d "${pkgdir}/usr/share/icons"
    rm -rf "${pkgdir}/${_gitname}"
}
