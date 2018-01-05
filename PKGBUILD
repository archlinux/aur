# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>

pkgname=orange
pkgver=0.4
pkgrel=7
pkgdesc="a helper tool for synce"
arch=('x86_64')
url="http://synce.sourceforge.net/"
license=("GPL")
depends=('dynamite' 'synce-core' 'file' 'unshield')
source=(http://downloads.sourceforge.net/sourceforge/synce/liborange-$pkgver.tar.gz)
md5sums=('40e9ac3de389c74a60007f7493e072a5')

build() {
  cd "$srcdir"/liborange-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/liborange-$pkgver
  make DESTDIR="$pkgdir" install
}
