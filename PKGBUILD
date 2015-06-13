# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=python2-starpy
pkgver=1.0.0a13
pkgrel=2
pkgdesc="Twisted Protocols for interaction with Asterisk PBX"
license=('custom:"StarPy License"')
url="http://www.vrplumber.com/programming/starpy/"
source=("http://downloads.sourceforge.net/starpy/starpy-$pkgver.tar.gz")
md5sums=('00661caec56e54974a804daf5d2f172d')
arch=(any)
makedepends=('python2-distribute')
depends=('python2-twisted' 'python2-basicproperty')

build() {
  cd $srcdir/starpy-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/starpy-$pkgver
  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
  find $pkgdir -type d -name examples -or -name doc -or -name .svn | xargs rm -rf
  install -Dm 644 $srcdir/starpy-$pkgver/license.txt $pkgdir/usr/share/licenses/python-starpy/license
}
