# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=glu-git
pkgver=9.0.1
pkgrel=1
pkgdesc="Mesa OpenGL Utility library"
arch=('x86_64')
url="https://cgit.freedesktop.org/mesa/glu/"
license=('LGPL')
depends=('libgl')
provides=(glu)
conflicts=(glu)
source=("git+https://gitlab.freedesktop.org/mesa/glu.git")
sha512sums=('SKIP')
#validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

build() {
  cd "$srcdir/glu"
  ./configure --prefix=/usr --disable-static
  make
}

#check() {
#  cd "$srcdir/glu"
#  make -k check
#}

package() {
  cd "$srcdir/glu"
  make DESTDIR="$pkgdir/" install
}
