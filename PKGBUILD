# Maintainer: Air_WaWei

pkgname=gnome-shell-theme-air-git
pkgver=20151118
pkgrel=1
pkgdesc="Grub2 theme Air"
url="https://github.com/WaWei/gnome-shell-theme-air"
arch=('any')
license=('GPLv3')
depends=('grub')
makedepends=('git')
install=${pkgname}.install
source=("${pkgname}"::"git+https://github.com//WaWei/gnome-shell-theme-air")
conflicts=('gnome-shell-theme-air')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
    cd "$srcdir/${pkgname}"
    find ./Air/ -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/themes/{}" \;
}
