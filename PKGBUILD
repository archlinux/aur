# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=vimb
pkgver=2.11
pkgrel=1
pkgdesc='The vim-like browser'
arch=('i686' 'x86_64')
url=http://fanglingsu.github.io/vimb
license=('GPL3')
depends=('webkitgtk')
makedepends=('hardening-wrapper')
source=("vimb-$pkgver.tar.gz::https://github.com/fanglingsu/vimb/archive/$pkgver.tar.gz")
sha256sums=('2ec583e6e425f8d620b54db6bcc56483770c7c5fd3f93b0429ddd6f7a7553935')

build() {
  cd vimb-$pkgver
  make GTK=3
}

package() {
  cd vimb-$pkgver
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
