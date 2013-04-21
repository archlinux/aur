# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=stag-git
_gitname=stag
pkgver=62.b64612a
pkgrel=1
pkgdesc="A C curses based mp3/ogg/flac tagging application (git version)"
arch=('i686' 'x86_64')
url="http://cryptm.org/~sturm/stag.html"
license=('custom:none')
depends=('ncurses' 'taglib')
makedepends=('git')
options=('!buildflags')
provides=('stag')
conflicts=('stag')
source=('git+https://github.com/smabie/stag.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  install -Dm 755 stag $pkgdir/usr/bin/stag
  install -D stag.1 $pkgdir/usr/share/man/man1/stag.1
}

# vim:set ts=2 sw=2 et:
