# Maintainer: Yamada Hayao <hayao@fascode.net>

pkgname=win11-gtk-theme-git
_pkgname=win11-gtk-theme
_gitname=windows11-GTKtheme
pkgver=r10.62225c3
pkgrel=1
pkgdesc="GTK theme like Windows 11"
arch=('any')
url='https://github.com/zayronxio/windows11-GTKtheme'
license=('GPL')
depends=()
optdepends=()
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}/${_gitname}" "${pkgdir}/usr/share/themes"
}
