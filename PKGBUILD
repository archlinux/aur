# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: 3ED <kas1987@o2.pl>

pkgname=gkrellxmms2
_filename=gxmms2
arch=('i686' 'x86_64')
pkgver=0.7.1
pkgrel=2
pkgdesc="A plugin for GKrellM2 to control basic functions of XMMS2"
url="http://wejp.k.vu/projects/xmms2/"
license="GPL"
depends=('xmms2' 'gtk2' 'gkrellm')
source=(http://wejp.k.vu/files/$_filename-$pkgver.tar.gz)
sha256sums=('fa3fef28935d29665bd7d788db2dcd131e177c7d9ee71423c096a410bfc05a27')

build() {
  cd "$srcdir/$_filename-$pkgver"
  make PREFIX=/usr gkrellxmms2
}
package() {
  cd "$srcdir/$_filename-$pkgver"
  make KRELLPREFIX="$pkgdir/usr" install_gkrellxmms2
}

