# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: se7enday(87635645#qq.com)

pkgname=grub2-theme-vimix-git
pkgver=20150513
pkgrel=1
pkgdesc="Grub2 theme Vimix"
url="https://github.com/Se7endAY/grub2-theme-vimix"
arch=('any')
license=('GPLv3')
depends=('grub')
makedepends=('git')
install=${pkgname}.install
source=("${pkgname}"::"git+https://github.com/Se7endAY/grub2-theme-vimix")
conflicts=('grub2-theme-vimix')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
    cd "$srcdir/${pkgname}"
    find ./Vimix/ -type f -exec install -Dm644 {} \
        "${pkgdir}/boot/grub/themes/{}" \;
}

