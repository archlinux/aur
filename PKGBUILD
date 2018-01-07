# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=librcd
pkgver=0.1.14
pkgrel=1
pkgdesc="Charset Detection Library"
arch=(x86_64)
url="http://rusxmms.sourceforge.net/"
depends=(glibc)
license=('GPL')
#source=(http://downloads.sourceforge.net/rusxmms/${pkgname}-${pkgver}.tar.bz2)
source=(http://darksoft.org/files/rusxmms/librcd-$pkgver.tar.bz2)
md5sums=('f6eb72dbdbc97f6563f527a24253fc4a')

build() {
  cd "$srcdir"/$pkgname-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-${pkgver}
  make DESTDIR="$pkgdir" install
}
