# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=fala
pkgver=0.1
pkgrel=3
pkgdesc="Fala - A simple text reader"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/fala/"
license=('GPL')
depends=('python2' 'festival' 'pygtk')
source=(http://downloads.sourceforge.net/project/fala/fala/0.1/fala_0.1-1.tar.gz)
md5sums=('dd5fc2c786c524b984a6185e000178bf')

prepare() {
  cd "$srcdir/$pkgname/src"
  sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" *
}

build() {
  cd "$srcdir/$pkgname"
  make || return 1
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
