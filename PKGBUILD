# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=buku_run-git
_pkgname=buku_run
pkgver=19.60bf7e5
pkgrel=1
pkgdesc="rofi frontend for buku bookmarks manager"
arch=('any')
url='https://github.com/carnager/buku_run'
provides=('buku_run')
license=('GPL')
depends=('gawk' 'buku' 'rofi')
makedepends=('git')
source=("git+https://github.com/carnager/${_pkgname}.git")

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
