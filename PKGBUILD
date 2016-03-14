# Maintainer: Weitian Leung <weitianleung@gmail.com>

pkgname=xdiff-ext-git
_pkgver=0.2.0
pkgver=${_pkgver}.r18
pkgrel=2
pkgdesc="A Thunar extension for launching file comparison tools"
arch=('i686' 'x86_64')
url="https://github.com/timxx/xdiff-ext"
license=('BSD')
depends=('thunar')
makedepends=('xfce4-dev-tools' 'pkgconfig')
install=$pkgname.install
source=("$pkgname::git+https://github.com/timxx/xdiff-ext.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "${_pkgver}.r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
