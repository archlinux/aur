# Maintainer: Maurício de Lima <mauriciodelima.mol@gmail.com>

pkgname=archiso-grub-themes
pkgver=73
pkgrel=1
pkgdesc="Theme Archiso for Grub"
arch=('any')
url="https://gitlab.com/uaiso/labs/uarchiso/$pkgname"
license=('GPL3')
depends=('grub')
provides=("$pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

if [ -e "${pkgname}.install" ];then
    install=${pkgname}.install
fi

package() {

    InternalDir="${srcdir}/${pkgname}"

    # Copy files
    if [ -d "${InternalDir}/usr" ]; then
        cp -r "${InternalDir}/usr" "${pkgdir}/"
    fi

    if [ -d "${InternalDir}/etc" ]; then
        cp -r "${InternalDir}/etc" "${pkgdir}/"
    fi

    if [ -d "${InternalDir}/opt" ]; then
        cp -r "${InternalDir}/opt" "${pkgdir}/"
    fi
}
