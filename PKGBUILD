# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
# Contributor: kess <joe@macmahon.eu>
# Contributor: damir <damir@archlinux.org>
# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=abcm2ps
pkgver=7.8.14
pkgrel=1
pkgdesc="Convert ABC music notation files to PostScript from the commandline"
arch=('i686' 'x86_64')
url="http://moinejf.free.fr/"
license=('GPL')
depends=('pango' 'freetype2')
conflicts=('abcm2ps-devel')
groups=(abc)
source=(http://moinejf.free.fr/$pkgname-$pkgver.tar.gz)
sha256sums=('31c55865a914d56c12e2b7cbeaf5e4a09b47bbe79f1c7b5cd1576a16f3753d07')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix="$pkgdir/usr" docdir=$pkgdir/usr/share/doc install
}