# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
pkgname=selene-media-encoder-bzr
pkgver=r185
pkgrel=1
pkgdesc="A simple but powerful audio/video converter for many formats (latest bzr revision)"
arch=(any)
url="http://teejeetech.blogspot.in/p/selene-media-encoder.html"
license=('GPL')
depends=('gtk3' 'json-glib' 'libgee06' 'libsoup' 'mediainfo' 'vala' 'libav')
makedepends=('bzr')
provides=('selene-media-encoder')
conflicts=('selene-media-encoder')
source=('selene::bzr+https://code.launchpad.net/~teejee2008/selene/trunk')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/selene"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "$srcdir/selene"
  make
}

package() {
  cd "$srcdir/selene"
  make DESTDIR="$pkgdir/" install
}
