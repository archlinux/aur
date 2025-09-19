# Maintainer: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>
pkgname=flightgear-data
pkgver=2024.1.2
pkgrel=1
pkgdesc="Base-Data for the opensource flight-simulator."
arch=('any')
provides=('flightgear-data=${pkgver}')
conflicts=('flightgear-data-git')
depends=('perl' 'bash' 'python')
license=('GPL-2.0-or-later')
url="http://www.flightgear.org/"
options=('!strip' '!debug')
source=("https://gitlab.com/flightgear/fgdata/-/archive/${pkgver}/fgdata-${pkgver}.tar.gz")
sha256sums=('7a121f5f0a0005bfddb90d09f350109072cb86a8f1db490e4fa214da5fceda27')

prepare() {
  mv $srcdir/fgdata-${pkgver} $srcdir/fgdata
}

package() {
  mkdir -p $pkgdir/usr/share/flightgear
  mv $srcdir/fgdata $pkgdir/usr/share/flightgear/data
  chmod -R 755 $pkgdir/usr/share/flightgear/data/*
}
