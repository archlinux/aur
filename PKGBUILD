# Maintainer: Ainola

pkgname=unruu-git
pkgver=v0.1.1.r18.g39d8a2a
pkgrel=1
pkgdesc='Extracts HTC RUU'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('unshield')
url='https://github.com/kmdm/unruu/'
source=('git+https://github.com/kmdm/unruu.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/unruu"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/unruu"
  ./autogen.sh
  ./configure
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/unruu/unruu" "$pkgdir/usr/bin/unruu"
}
