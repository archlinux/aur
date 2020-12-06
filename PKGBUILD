# Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=dmenu-pryme-svg
pkgver=r3.426b5b3
pkgrel=1
pkgdesc="pryme-svgs customized fork of dmenu"
arch=(any)
url="https://gitlab.com/pryme-svg/dmenu"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=(git+$url)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $srcdir/dmenu
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dmenu
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd dmenu
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
