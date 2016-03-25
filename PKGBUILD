# Maintainer: Tudor Roman <xenogenesis at openmailbox dot org>
pkgname=mpvc-git
pkgver=1
pkgrel=1

pkgdesc='A mpc-like control interface for mpv.'
url='https://github.com/wildefyr/mpvc'
arch=('i686' 'x86_64')
license=('MIT')

depends=('mpv' 'socat')

provides=('mpvc')

source=('git://github.com/wildefyr/mpvc')

md5sums=('SKIP')

pkgver() {
  cd mpvc
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd mpvc
}

package() {
  cd mpvc
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
