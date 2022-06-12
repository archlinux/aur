# Maintainer: Laurence Willetts <laurencewilletts at protonmail dot com>
pkgname=mpvc-git
pkgver=1.3.r24.g6890b36
pkgrel=1

pkgdesc='A mpc-like control interface for mpv.'
url='https://github.com/lwilletts/mpvc'
arch=('i686' 'x86_64')
license=('MIT')

depends=('mpv' 'socat' 'bc')

provides=('mpvc')

source=("git+$url")

md5sums=('SKIP')

pkgver() {
  cd "$srcdir/mpvc"
  git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/mpvc"
}

package() {
  prefix="/usr"
  cd "$srcdir/mpvc"
  make DESTDIR="$pkgdir" PREFIX="$prefix" install
}
