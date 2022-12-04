# Maintainer: Efe Çetin <efectn@protonmail.com>

pkgname=grub-theme-minegrub-git
pkgver=r19.e267a9f
pkgrel=1
pkgdesc="A Grub Theme in the style of Minecraft!"
arch=('any')
url="https://github.com/Lxtharia/minegrub-theme"
license=('none')
depends=('grub')
makedepends=('git')
provides=(grub-theme-minegrub)
conflicts=(grub-theme-minegrub)
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
_themedir="/usr/share/grub/themes/minegrub"

pkgver() {
    cd "${srcdir}/${pkgname}"
    
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}"

    # TODO: Add license
    install -dm755 ${pkgdir}${_themedir}
    cp -rf --no-preserve=ownership "${pkgname}"/* ${pkgdir}${_themedir}
}
