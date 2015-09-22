_pkgname=gtkevemon
_gitname=gtkevemon

pkgname=$_pkgname-git
pkgver=r228.f38c0e8
pkgrel=1
pkgdesc="EVE Online skill monitor"
arch=('i686' 'x86_64')
url="https://github.com/gtkevemon/gtkevemon/"
license=('GPL3')
depends=('gtkmm' 'libxml2' 'openssl')
makedepends=('gtkmm' 'git')
provides=('gtkevemon')
conflicts=('gtkevemon' 'gtkevemon-svn' 'gtkevemon-hg')
replaces=('gtkevemon-hg')
source=("git+https://github.com/gtkevemon/$_gitname/")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/gtkevemon/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/gtkevemon/"
    make
}

package() {
    cd "${srcdir}/gtkevemon/"
    make PREFIX=$pkgdir/usr install
}
