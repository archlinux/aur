# Maintainer: Pedro Silva <psilva+git at pedrosilva dot pt>
# Contributor: Juri Grabowski <archlinux-aur at juri-grabowski dot de>

pkgname=blogc
pkgver=0.14.0
pkgrel=1
pkgdesc="blogc is a blog compiler. It converts source files and templates into blog/website resources"
arch=('x86_64')
url="http://blogc.org"
license=('BSD 3 clause license')
depends=()
options=('!emptydirs')
source=("https://github.com/blogc/blogc/releases/download/v${pkgver}/blogc-${pkgver}.tar.gz")
md5sums=('6e133aa33004cccbb846a4cf80ce9fe2')

build() {
  cd  $srcdir/blogc-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr/ --enable-git-receiver --enable-runserver
  make
}

package() {
  cd  $srcdir/blogc-$pkgver
  make install DESTDIR=$pkgdir
}
