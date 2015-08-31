# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=meh-git
pkgver=0.3.26.gce484db
pkgrel=1
pkgdesc="A minimal image viewer using raw XLib."
arch=('i686' 'x86_64')
url="http://www.johnhawthorn.com/meh/"
license=('custom:MIT')
depends=('libxext' 'libjpeg' 'giflib' 'libpng')
optdepends=('imagemagick')
conflicts=('meh')
source=('git+https://github.com/afarah1/meh.git')
md5sums=('SKIP')
_gitname=meh

pkgver () {
  cd $srcdir/$_gitname
  git describe --tags |sed s+-+.+g | cut -c2-
}

build() {
  cd $srcdir/$_gitname
  make PREFIX=/usr
}

package() {
  cd $srcdir/$_gitname
  install -D -m 755 meh $pkgdir/usr/bin/meh
  install -D -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


