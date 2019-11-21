# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
pkgname=ayatana-ido
pkgver=0.4.4
pkgrel=3
pkgdesc='Ayatana Indicator Display Objects'
arch=('x86_64')
url='https://github.com/AyatanaIndicators/ayatana-ido'
license=('LGPL2.1' 'LGPL3')
depends=('gtk3' 'glib2')
makedepends=('mate-common' 'gtk-doc' 'gobject-introspection' 'vala')
source=("https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ef04b0b6c959d209e88b1de322ac64ea33fdd043a73980bf3b043380603b6a448ea7bf43ba8e2750e1a0a9bef704a7099f7ae9b92a97d3ce0be2e9f48ba16703')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr
  make -i
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install -i
  find ${pkgdir}/usr/lib -name *.la -delete
}
