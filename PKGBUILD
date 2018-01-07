# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=pdmenu
pkgver=1.3.2
pkgrel=2
pkgdesc="simple full screen menu program"
arch=('x86_64')
url="http://packages.debian.org/unstable/source/pdmenu"
license=('GPL')
depends=('gpm' 'slang')
optdepends=('perl')
source=(http://ftp.debian.org/debian/pool/main/p/pdmenu/pdmenu_$pkgver.tar.gz)
md5sums=('a7d5315119fd18a81cc3d1e578f8d3f8')

build() {
  cd "$srcdir"/pdmenu
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir"/pdmenu
  make INSTALL_PREFIX="$pkgdir" install
}
