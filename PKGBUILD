# Maintainer: daniel de souza telles <danieldesouzatelles at gmail dot com>
pkgname=buku-rofi-git
_pkgname=buku-rofi
pkgver=1.0
pkgrel=1
pkgdesc="rofi frontend for buku bookmarks manager"
arch=('any')
url='https://gitlab.com/lbcnz/agnostic-browser'
provides=('buku-rofi')
license=('GPL')
depends=('gawk' 'buku' 'rofi')
makedepends=('git')
source=("git+https://gitlab.com/lbcnz/${_pkgname}.git")

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

md5sums=('SKIP')

