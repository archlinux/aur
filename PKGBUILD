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
sha512sums=('62f516ada352c864923754fa6fff1573b97543abe317668e35ad51723c36d8bd5c4f58a13ea7fecb741c3527d9211207fa5e08f8b9ae16ca6fbeef3e59f371bb')

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
