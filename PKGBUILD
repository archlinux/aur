# Maintainer: m4sk1n <m4sk1n@vivaldi.net>
pkgname=xnots-git
pkgver=r34.3f3e8d1
pkgrel=1
pkgdesc="A desktop post-it/sticky note system for the unix geek"
arch=('i686' 'x86_64')
url="https://github.com/thePalindrome/xnots"
license=('GPL')
depends=('xorg-server' 'xorg-xrandr' 'pango')
makedepends=('git')
provides=('xnots')
conflicts=('xnots')
options=()
source=(git://github.com/thePalindrome/xnots.git)
sha256sums=('SKIP')

build() {
  cd "xnots"
  export CFLAGS="-O2"

  make
}

package() {
  cd "xnots"

  make prefix="$pkgdir/usr/" datadir="$pkgdir/usr/share/doc" install
}