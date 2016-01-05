# $Id: PKGBUILD 216470 2016-01-04 04:21:35Z fladam $
# Maintainer: Juri Grabowski <archlinux-aur at juri-grabowski dot de>
# Contributor: Juri Grabowski <archlinux-aur at juri-grabowski dot de>

pkgname=blogc
pkgver=0.5.1
pkgrel=0
pkgdesc="blogc is a blog compiler. It converts source files and templates into blog/website resources"
arch=('any')
url="http://blogc.org"
license=('BSD 3 clause license')
depends=()
options=('!emptydirs')
source=("https://github.com/blogc/blogc/releases/download/v${pkgver}/blogc-${pkgver}.tar.gz")
md5sums=('8eb26fb36197eae494c5292a9edc0771')


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
