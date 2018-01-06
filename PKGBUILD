# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=lwp
pkgver=2.6
pkgrel=3
pkgdesc="Light weight process library"
arch=(x86_64)
url="http://www.coda.cs.cmu.edu"
license=("LGPL")
depends=()
validpgpkeys=('477F78AA863A90A623664AA1CE0D7E10997007A2')
source=(http://www.coda.cs.cmu.edu/pub/lwp/src/lwp-$pkgver.tar.gz{,.asc})
sha256sums=('4887fd7f74564552f53dfe42440f4777808a82b1249b2733ecfd062849a4d32d'
            'SKIP')

build() {
  cd "$srcdir"/lwp-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/lwp-$pkgver
  make DESTDIR="$pkgdir" install
}
