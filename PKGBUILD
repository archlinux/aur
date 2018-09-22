# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
pkgname=ayatana-ido
pkgver=0.4.4
pkgrel=1
pkgdesc='Ayatana Indicator Display Objects'
arch=('x86_64')
url='https://ayatana-indicators.org'
license=('LGPL2.1' 'LGPL3')
depends=('gtk3' 'glib2')
makedepends=('mate-common' 'gtk-doc')
source=("http://releases.ayatana-indicators.org/source/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('c64b1d272b778ec0f3de51afa0e3e73765ea2efebd3db9426ee6df0814deffd092a6d82c649a7ee530ae824d7af49bc7fec50b3d0b8725bdeed61c95f77295f9')

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
