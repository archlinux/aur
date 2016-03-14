# Maintainer: Sergey Kostyaev <feo.me@ya.ru>
pkgname=distel
pkgver=20160223
pkgrel=1
pkgdesc="Distributed Emacs Lisp for Erlang."
arch=('i686' 'x86_64')
url="https://github.com/massemanet/distel"
license=('BSD')
depends=('erlang' 'emacs')
source=(${pkgname%-git}::git+https://github.com/massemanet/distel)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  export prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  export prefix=$pkgdir/usr
  make -e install
}

# vim:set ts=2 sw=2 et:
