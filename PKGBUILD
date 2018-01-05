# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>

pkgname=matchbox-desktop
pkgver=2.2
pkgrel=1
pkgdesc="A PDA style application launcher or 'item browser'."
arch=('x86_64')
license=('GPL')
depends=('libmatchbox' 'startup-notification' 'libpng' 'gtk3')
url="http://matchbox-project.org/"
source=("http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-desktop-2/snapshot/matchbox-desktop-2-$pkgver.tar.bz2")
sha256sums=('7975f0b1c46e59ffd18a5cd68f22b8da79e9af1ccd263fdbc2bc08e2a2e1b49e')

build() {
  cd "$srcdir"/$pkgname-2-$pkgver
  autoreconf -v --install
  ./configure --sysconfdir=/etc --prefix=/usr --enable-startup-notification
  make
}

package() {
  cd "$srcdir"/$pkgname-2-$pkgver
  make DESTDIR="$pkgdir" install
}
