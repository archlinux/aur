# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Andrew Trabo <v01d3r@gmail.com>

pkgname=peyote
pkgver=0.9.12
pkgrel=2
pkgdesc="Audio player with a Midnight Commander interface"
url="http://peyote.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('desktop-file-utils' 'gstreamer0.10-python' 'gtk-update-icon-cache' 'mutagen' 'pygtk' 'python2-dbus' 'python2-notify')
optdepends=("rxvt-unicode: default terminal emulator for xpeyote")
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/peyote/Linux/${pkgname}_$pkgver.tar.bz2)
sha256sums=('62180b2ba63b0d99ef27bb7753304c08cf557534f7bab7586dd37fdbe6f9e76f')

build() {
  cd ${pkgname}_$pkgver
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}_$pkgver
  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
  make DESTDIR="$pkgdir/" install
}

