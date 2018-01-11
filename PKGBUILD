# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.3.3
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://github.com/elboulangero/goodvibes"
license=('GPL')
depends=("glib2" "dconf" "gtk3" "libsoup" "libkeybinder3"
         "gst-plugins-base" "gst-plugins-good" "gst-plugins-ugly")
source=("https://github.com/elboulangero/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d76c55c2e9f5effa676aaeeae03fa263adb205f87f08ce60e4e1068c5dc597aa')

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
