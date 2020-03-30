# Maintainer: eugene hwang <hwang dot eug at gmail dot com>

pkgname=rofi-buku-git
_pkgname=rofi-buku
pkgver=71.73ad31d
pkgrel=1
pkgdesc="rofi frontend for buku bookmarks manager"
arch=('any')
provides=('rofi-buku')
license=('GPL')
depends=('gawk' 'buku' 'rofi')
makedepends=('git')
source=("git+https://github.com/knatsakis/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       install
}

