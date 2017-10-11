
pkgbase=python-rawpy
pkgname=('python-rawpy' 'python2-rawpy')
pkgver=0.10.1
pkgrel=2
pkgdesc="Python wrapper for the LibRaw library"
arch=(any)
license=('MIT License')
url="https://pypi.python.org/pypi/rawpy"
depends=('python' 'libraw' 'python-numpy')

source=("https://codeload.github.com/letmaik/rawpy/tar.gz/v0.10.1")
sha256sums=('62454597ae36e3ae91219775ff7323aa508afe451b7a48740c8720a6a5e9fd4b')

prepare() {
  cp -a rawpy-$pkgver{,-py2}
}

build() {
  cd "$srcdir/rawpy-$pkgver"
 # python setup.py install --root=$pkgdir --prefix=usr --optimize=1
  
  cd "$srcdir/rawpy-$pkgver-py2"
 # python2 setup.py install --root=$pkgdir --prefix=usr --optimize=1
}

package_python2-rawpy() {
  cd "$srcdir/rawpy-${pkgver}-py2"
  #echo ${pkgdir}
  python2 setup.py install --root=$pkgdir --prefix=usr --optimize=1
}

package_python-rawpy() {
  cd "$srcdir/rawpy-${pkgver}"
  #echo ${pkgdir}
  python setup.py install --root=$pkgdir --prefix=usr --optimize=1
}

