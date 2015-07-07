# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
pkgname=selene-media-encoder
pkgver=2.5.2 # bzr revision 185
pkgrel=1
pkgdesc="A simple but powerful audio/video converter for many formats"
arch=('i686' 'x86_64')
url="http://teejeetech.blogspot.in/p/selene-media-encoder.html"
license=('GPL')
depends=('gtk3' 'json-glib' 'libgee06' 'libsoup' 'mediainfo' 'vala' 'libav')
makedepends=('bzr')
source=('selene::bzr+https://code.launchpad.net/~teejee2008/selene/trunk#revision=185' '0001-fix-ambiguous-references.patch')
md5sums=('SKIP'
         'c330c93625c5a783c482aa80dfbbd1d1')

prepare() {
  cd "$srcdir/selene"
  patch -p1 < ../0001-fix-ambiguous-references.patch
}

build() {
  cd "$srcdir/selene"
  make
}

package() {
  cd "$srcdir/selene"
  make DESTDIR="$pkgdir/" install
}
