# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>

pkgname=moserial
pkgver=3.0.8
pkgrel=1
pkgdesc="Clean, friendly gtk-based serial terminal for the gnome desktop"
arch=('i686' 'x86_64')
url="http://live.gnome.org/moserial"
license=('GPL3')
depends=('gtk3' 'gnome-doc-utils' 'gsettings-desktop-schemas'
         'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('lrzsz: for xmodem, ymodem and zmodem file transfer protocols')
makedepends=('intltool')
install=moserial.install
source=("http://ftp.gnome.org/pub/GNOME/sources/moserial/3.0/$pkgname-$pkgver.tar.xz")
sha256sums=('baa53fb046485653d16ea879072a2f29b138faeced92f7d1ff045ba8db752073')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
