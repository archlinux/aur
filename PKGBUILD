# Maintainer: Javier Tia <javier.tia at gmail dot com>
pkgname=mocicon
pkgver=0.1.4
pkgrel=8
pkgdesc="GTK panel applet that lets you control MOC (Music On Console)"
url="http://mocicon.sourceforge.net"
license=('BSD')
arch=('i686' 'x86_64')
depends=('moc' 'gtk2')
source=("http://downloads.sourceforge.net/sourceforge/mocicon/mocicon-${pkgver}.tar.bz2")
sha256sums=('5bf4b4af5dee77c72f80e842c974972fb8908953f1cbaab51617057a53dc178a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  msg "Starting build process."
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR=${pkgdir} install
}

# vim:set ft=sh ts=2 sw=2 et:
