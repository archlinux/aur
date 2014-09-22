# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>

pkgname=moserial
pkgver=3.0.9
pkgrel=1
pkgdesc="Clean, friendly gtk-based serial terminal for the gnome desktop"
arch=('i686' 'x86_64')
url="http://live.gnome.org/moserial"
license=('GPL3')
depends=('gtk3' 'gnome-doc-utils' 'gsettings-desktop-schemas')
optdepends=('lrzsz: for xmodem, ymodem and zmodem file transfer protocols')
makedepends=('intltool')
install=$pkgname.install
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('6bba85ae6367d9ecfe6a72af9fc354b3ce840ac42ad6e4dcb18b01088fc874cd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
