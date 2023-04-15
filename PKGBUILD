# Maintainer: Mikhail Klimenko <m@klimenko.site>
pkgname=gopnik2-git
pkgdesc="Russian text-based adventure game from 90s"
pkgver=r128.4c0015c
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1

arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/bolknote/gopnik2"
license=('WTFPL')
depends=('glibc' 'gcc-libs')
makedepends=('gettext' 'git' 'cmake')
source=(gopnik2::git+https://github.com/bolknote/gopnik2.git)
md5sums=('SKIP')

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  install -Dsm755 "$srcdir/${pkgname%-git}/gop2" "$pkgdir/usr/bin/gop2"
}

