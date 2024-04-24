# Maintainer: Stephen Smith <stephen304@gmail.com>
pkgname=tty2gif-git
_pkgname=tty2gif
pkgver=0.2.r4.ge7d2c39
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
  git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 tty2gif "$pkgdir/usr/bin/tty2gif"
}
