# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=justext  
pkgver=1.1
pkgrel=1
pkgdesc="jusText removes boilerplate content (such as navigation links, headers, and footers) from HTML pages. Designed to preserve text with full sentences, it is suited for creating linguistic resources like Web corpora."
url="https://code.google.com/p/justext/"
arch=('i686' 'x86_64')
license=('New BSD License')
depends=('python2>=2.2.4')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://justext.googlecode.com/files/justext-1.1.tar.gz")
md5sums=('120d33a917a6362c88dd546d4f354c47')
build() {
  cd $startdir/src/$pkgname-$pkgver

  # From http://allanmcrae.com/2010/10/big-python-transition-in-arch-linux/
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')

  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
