# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz> 

pkgname=hildon-home
pkgver=0.3.73
pkgrel=0
pkgdesc="Hildon Home application"
url="https://github.com/maemo-leste/$pkgname"
arch=(any)
license=('LGPL2')
depends=(libhildon)
makedepends=(libhildondesktop libosso hildon-thumbnail libhildonfm 
             osso-bookmark-engine mce-headers sqlite autoconf m4 libtool)
groups=(hildon)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr \
	       CFLAGS="${CFLAGS} -Wno-error=deprecated-declarations -Wno-error=misleading-indentation"
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
