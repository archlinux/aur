# Maintainer: Ferdi265 <theferdi265 at gmail dot com>
pkgname=factortime-git
pkgver=0.1.r4.g8104776
pkgrel=1
pkgdesc="A small c program in hommage to xkcd 247 'Factoring the time'."
url="https://github.com/Ferdi265/factortime"
arch=('i686' 'x86_64')
license=('GPL')
source=("$pkgname::git+https://github.com/Ferdi265/factortime")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
