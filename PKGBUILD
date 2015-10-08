# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=grub2-theme-breeze
pkgname="${_pkgname}-git"
pkgver=r16.e8c4218
pkgrel=1
pkgdesc="A minimalistic GRUB theme inspired by Breeze"
arch=('any')
url="https://github.com/gustawho/${_pkgname}"
license=('CCPL:by-sa')
depends=('grub')
install=("${pkgname}.install")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/boot/grub/themes/
    cp -r ${srcdir}/${_pkgname}/breeze/ ${pkgdir}/boot/grub/themes/
}
