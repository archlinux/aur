# Maintainer: Miguel Bouza <miguelies.ruiz@gmail.com>
# Contributor: Andrea Fagiani <andfagiani@gmail.com>
# Contributor: Lisa Denia <eiffel56@gmail.com>

pkgname=ganyremote
pkgver=8.0
pkgrel=1
pkgdesc="GTK frontend for anyremote."
arch=('i686' 'x86_64')
url="http://anyremote.sourceforge.net/"
license=('GPL')
depends=('python' 'python-pybluez' 'pygtk' 'anyremote>=6.7' 'pygobject-devel' 'gtk3')
source=(http://downloads.sourceforge.net/sourceforge/anyremote/$pkgname-$pkgver.tar.gz)
sha256sums=(b5cc6af6843cf1cc45ff2e83135f15f51b64cd778958d00521e7d085f062f15d)

build() {
  cd $srcdir/$pkgname-$pkgver

  #export PYTHON="python2"

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  #sed -i -e \
  #'s:\(#!/usr/bin/env[ ]\+python$\|#!/usr/bin/python$\|\"python\):\12:g' \
  #$pkgdir/usr/bin/ganyremote
}
