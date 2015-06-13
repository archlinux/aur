# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=python2-basicproperty
pkgver=0.6.12a
pkgrel=2
pkgdesc="Core data-types and property classes"
license=('custom:"Basicproperty License"')
url="http://basicproperty.sourceforge.net/"
source=("http://downloads.sourceforge.net/basicproperty/basicproperty-$pkgver.tar.gz")
md5sums=('58ac527fa1b5bb120b0b936cbbc6a2c6')
arch=(i686 x86_64)
makedepends=('python2-distribute')
depends=('python2')

build() {
  cd $srcdir/basicproperty-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/basicproperty-$pkgver
  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
  install -Dm 644 $srcdir/basicproperty-$pkgver/basicproperty/license.txt $pkgdir/usr/share/licenses/python-basicproperty/license
}
