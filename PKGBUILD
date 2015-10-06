# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
# Category: office
pkgname='colorlatex-git'
pkgver=r36.1cd14d9
pkgrel=1
pkgdesc='A script to colorize the terminal output of LaTeX compilers'
arch=('any')
url='https://github.com/vivienm/colorlatex'
license=('GPL3')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
depends=('perl' 'texlive-bin')
makedepends=('git')
source=("$pkgname::git+https://github.com/vivienm/colorlatex.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr install
}
