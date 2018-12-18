# Mantainer: Young Acinonyx <young.acinonyx [at] gmail [dot] com>

pkgname=xfce-theme-blackbird-git
pkgver=v0.4.r33.gab4a30e
pkgrel=1
pkgdesc="Dark Desktop Suite for Xfce. Git version."
arch=(any)
url="https://github.com/shimmerproject/Blackbird"
license=('CCPL:cc-by-sa-3.0' 'GPL2')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('xfce-theme-blackbird')
conflicts=('xfce-theme-blackbird')
_gitname="Blackbird"
source=("$_gitname::git+https://github.com/shimmerproject/Blackbird.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
