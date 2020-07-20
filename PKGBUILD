# Maintaoner: Yamada Hayao <development@fascode.net>

pkgname=adara-theme-git
_pkgname=adara-theme
pkgver=r46.743fc0d
pkgrel=2
pkgdesc="Just a neutral theme for Cinnamon"
arch=('any')
url="https://github.com/germanfr/adara-theme"
license=('GPLv3')
depends=()
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')
conflicts=()

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"

    local copy_dirs=("Adara" "Adara-Dark")
    local dir

    mkdir -p "${pkgdir}/usr/share/themes/"

    for dir in ${copy_dirs[*]}; do
        cp -r "${dir}" "${pkgdir}/usr/share/themes/"
    done

    chmod 755 "${pkgdir}/usr/share/themes/"
}
