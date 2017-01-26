# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.2
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://github.com/elboulangero/goodvibes"
license=('GPL')
depends=("glib2" "libsoup" "libxml2" "gst-plugins-base"
         "gst-plugins-ugly" "gtk3" "libnotify" "dconf")
makedepends=("inkscape" "libkeybinder3")
source=("https://github.com/elboulangero/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('730612e15f40886eba3b61e0a6cd138c51799a5f9f3848291547426ae14b3aca')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
