# Maintainer: second2050 <aur@second2050.me>

_name=mikuboot
pkgname=plymouth-theme-${_name}-git
pkgver=r10.ed2e66d
pkgrel=1
pkgdesc='A miku boot animation because she is living in my computer.'
arch=('any')
url="https://gitlab.com/EvysGarden/mikuboot"
license=('MIT')
depends=('plymouth' 'cantarell-fonts')
makedepends=('git')
source=(
    "$pkgname::git+$url"
)
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}/${_name}"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/${_name}"
    install -Dvm644 ./* "${pkgdir}/usr/share/plymouth/themes/${_name}"
}

