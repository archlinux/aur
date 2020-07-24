# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
pkgname=ayatana-ido
pkgver=0.5.0
pkgrel=1
pkgdesc='Ayatana Indicator Display Objects'
arch=('x86_64')
url='https://github.com/AyatanaIndicators/ayatana-ido'
license=('LGPL2.1' 'LGPL3')
depends=('gtk3' 'glib2')
makedepends=('mate-common' 'gtk-doc' 'gobject-introspection' 'vala')
source=("https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('573dd0d6693670bfda0e883c94d483d708bb83f20eb621eae26a0624aa76045ba6e9563ce36587c9ca3d5acfe4b4c0d9f9ce8da62a788d206f3d00ebdded0228')

prepare() {
    cd "$pkgname-$pkgver"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
