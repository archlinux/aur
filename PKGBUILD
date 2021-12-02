# Maintainer: Adel Khial <adel.khial@gmail.com>
pkgname=earthy-gtk-theme-git
_pkgname=earthy-gtk-theme
pkgver=r5.51fdae4
pkgrel=1
pkgdesc="A theme for GTK based on Nordic and the gruvbox color scheme."
arch=(any)
url="https://github.com/stevensonmt/earthy"
conflicts=('earthy-gtk-theme')
provides=('earthy-gtk-theme')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
    cd "${srcdir}/${_pkgname}"
    cp -a ./* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
