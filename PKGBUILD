# Maintainer: Stephen Smith <stephen304@gmail.com>
pkgname=tty2gif-git
_pkgname=tty2gif
pkgver=.8a9f400
pkgrel=1
pkgdesc="tty2gif let you record scripts and their outputs into both binary and gif formats."
arch=('i686' 'x86_64')
url="https://github.com/z24/tty2gif"
license=('GPL3')
depends=('imagemagick')
makedepends=('git')
provides=('tty2gif-git')
conflicts=('tty2gif-git')
source=("$_pkgname::git+https://github.com/z24/tty2gif.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count xft-master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 tty2gif "$pkgdir/usr/bin/tty2gif"
}
