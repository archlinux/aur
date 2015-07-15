# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=python2-wordaxe
pkgver=1.0.1
pkgrel=5
pkgdesc="Hyphenation support for reportlab"
arch=('i686' 'x86_64')
url="http://deco-cow.sf.net"
license=('Apache')
depends=('python2' 'setuptools' 'docutils' 'python2-reportlab' 'python-pyhyphen')
source=(http://downloads.sourceforge.net/deco-cow/wordaxe-$pkgver.zip splitting.patch)

build() {
  cd $srcdir
  patch -p0 < splitting.patch
  cd wordaxe-$pkgver
  python2 setup.py install --root=$startdir/pkg || exit 1
  install -D $startdir/src/wordaxe-$pkgver/docs/license.txt $startdir/pkg/usr/share/licenses/python-wordaxe/COPYING
}
md5sums=('b1b5e4b2a3abec5a352d84e65c3b0dec'
         '60212f5716c1b9e2e57d8f1da3174654')
