# Maintainer: Alad Wenter <nynq@nepuyvahk.vasb> (rot13)
pkgname=pkgelf-git
pkgver=r48.8428984
pkgrel=2
pkgdesc="alpm package bintools"
arch=('i686' 'x86_64')
url="https://github.com/vodik/pkgelf"
license=('GPL')
depends=('pacman')
makedepends=('git')
conflicts=('pkgelf')
provides=('pkgelf')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}
