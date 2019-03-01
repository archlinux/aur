# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: se7enday(87635645#qq.com)
# I'm going to sleep. I'll work on it tomorrow.
pkgname=grub2-theme-vimix-git
pkgver=20170904
pkgrel=1
pkgdesc="Grub2 theme Vimix"
url="https://github.com/vinceliuice/grub2-themes/grub-theme-vimix"
arch=('any')
license=('GPLv3')
depends=('grub')
makedepends=('git' 'foo-package-doesnt-exist')
install=${pkgname}.install
source=("${pkgname}"::"git+https://github.com/vinceliuice/grub2-themes/")
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

