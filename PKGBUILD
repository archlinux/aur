
pkgbase=python-rawpy
pkgname=('python-rawpy' 'python2-rawpy')
pkgver=0.7.0
pkgrel=1
pkgdesc="Python wrapper for the LibRaw library"
arch=(any)
license=('MIT License')
url="https://pypi.python.org/pypi/rawpy"
depends=('python' 'libraw' )

source=("https://pypi.python.org/packages/05/eb/c6965bd3bc9a622c24939c4df8543e4ffa3b214777c765ff4fb8d8bf7a81/rawpy-0.7.0.tar.gz")
md5sums=('f7e1d221e9768afcad115f3e6dd68a59')

prepare() {
  cp -a rawpy-$pkgver{,-py2}
}

build() {
  cd "$srcdir/rawpy-$pkgver"
  python setup.py build
  
  cd "$srcdir/rawpy-$pkgver-py2"
  python2 setup.py build
}

package_python2-rawpy() {
  cd "$srcdir/rawpy-$pkgver"
  echo ${pkgdir}
  python setup.py install --root=${pkgdir} --prefix=usr --optimize=1
}

package_python-rawpy() {
  cd "$srcdir/rawpy-$pkgver"
  echo ${pkgdir}
  python setup.py install --root=${pkgdir} --prefix=usr --optimize=1
}

