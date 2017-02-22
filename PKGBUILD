# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.3.1
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://github.com/elboulangero/goodvibes"
license=('GPL')
depends=("glib2" "dconf" "gtk3" "libsoup" "libkeybinder3"
         "gst-plugins-base" "gst-plugins-good" "gst-plugins-ugly")
source=("https://github.com/elboulangero/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('47d5fe9689eb9d91338dddfac2ede5353b1885793f31166ba3d794fcfdc43ed5')

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
