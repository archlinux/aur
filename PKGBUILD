# Maintainer: Amos Onn <amosonn at gmail dot com>
pkgbase=python-dpms
pkgname=('python-dpms' 'python2-dpms')
_pkgname=python-dpms
_pkgver=e41b902
pkgver=r5.$_pkgver
pkgrel=1
pkgdesc="Python Bindings to DPMS X11 extension"
arch=('any')
url="https://github.com/dirjud/python-dpms"
license=("UNKNOWN")
depends=('libx11' 'libxext')
source=(https://codeload.github.com/amosonn/python-dpms/tar.gz/$_pkgver)
sha256sums=('4b48b367f5fac65e242031399cbb65c3dab70a8f31dc7eaac9aae018f04c93b6')

prepare() {
  cp -a $_pkgname-$_pkgver{,-py2}
}

package_python-dpms() {
  depends+=('python')
  cd $srcdir/$_pkgname-$_pkgver
  python setup.py install --root=$pkgdir || return 1
  #install -d $pkgdir/usr/share/licenses/$pkgname
  #install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}

package_python2-dpms() {
  depends+=('python2')
  cd $srcdir/$_pkgname-$_pkgver-py2
  python2 setup.py install --root=$pkgdir || return 1
  #install -d $pkgdir/usr/share/licenses/$pkgname
  #install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}
