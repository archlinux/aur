# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=fbmix
pkgver=0.4.1
pkgrel=1
pkgdesc="A simple mixer applet for the system tray"
arch=('i686' 'x86_64')
url="http://sandbox.ltmnet.com/page/projects/fbmix"
license=('GPL')
depends=('alsa-lib' 'vte')
source=("http://sandbox.ltmnet.com/downloads/${pkgname}-${pkgver}.tar.bz2")
md5sums=('12d3571658b6fa5b5f3bbb3dad9493d1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 fbmix $pkgdir/usr/bin/fbmix
  install -D -m644 icons/fbmix.png $pkgdir/usr/share/icons/fbmix.png
  install -D -m644 conf/fbmix $pkgdir/usr/share/fbext/fbmix/config
}

# vim:set ts=2 sw=2 et:
