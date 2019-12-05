# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
pkgname=ayatana-ido
pkgver=0.4.90
pkgrel=1
pkgdesc='Ayatana Indicator Display Objects'
arch=('x86_64')
url='https://github.com/AyatanaIndicators/ayatana-ido'
license=('LGPL2.1' 'LGPL3')
depends=('gtk3' 'glib2')
makedepends=('mate-common' 'gtk-doc' 'gobject-introspection' 'vala')
source=("https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('51daa6ee69cbd52be87d40a573a89b1c46f301adef4b4b84ca7fd7b96fe48008907c876fedd578f642e360c5d8b0ca1c976b654f598dea60f1b0b47dcbae3dce')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  find ${pkgdir}/usr/lib -name *.la -delete
}
