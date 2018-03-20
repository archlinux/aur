# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.3.5
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://github.com/elboulangero/goodvibes"
license=('GPL')
depends=("glib2" "dconf" "gtk3" "libsoup" "libkeybinder3"
         "gst-plugins-base" "gst-plugins-good" "gst-plugins-ugly")
source=("https://github.com/elboulangero/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ca6bece060c58693108ccea225352d02dd66478c4c142d02b7685b6f1a219b20')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --enable-all
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
