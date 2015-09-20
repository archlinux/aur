# $Id: PKGBUILD 216470 2014-07-04 04:21:35Z fyan $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Hunt <lazy at brandnewmath dot com>

pkgname=blogc
pkgver=0.1
pkgrel=0
pkgdesc="blogc is a blog compiler. It converts source files and templates into blog/website resources"
arch=('any')
url="http://blogc.org"
license=('BSD 3 clause license')
depends=()
options=('!emptydirs')
source=("https://github.com/blogc/blogc/releases/download/v0.1/blogc-0.1.tar.gz")
md5sums=('c7156ea14591fdf01c45e969792cfc73')


build() {
  cd  $srcdir/blogc-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr/
  make
}

package() {
  cd  $srcdir/blogc-$pkgver
  make install DESTDIR=$pkgdir
}
