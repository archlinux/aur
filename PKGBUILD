# Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=st-pryme-svg
pkgver=r1134.b1c12ce
pkgrel=1
pkgdesc="pryme-svgs customized fork of st"
arch=(any)
url="https://gitlab.com/pryme-svg/st"
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
  cd $srcdir/st
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd st 
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd st 
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
