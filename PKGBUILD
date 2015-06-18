# Maintainer: Andrés Rodríguez <andres.rodriguez __at__ lithersoft.com>

pkgname=('cython2-kivy')
pkgver=0.22
pkgrel=1
pkgdesc="C-Extensions for Python; Kivy-compatible version"
arch=(i686 x86_64)
url="http://www.cython.org"
license=('APACHE')
depends=('python2')
makedepends=('python2-setuptools')
provides=('cython2=0.21.2')
conflicts=('cython2')
source=("http://cython.org/release/Cython-$pkgver.tar.gz")
md5sums=('1ae25add4ef7b63ee9b4af697300d6b6')

package() {
  cd $srcdir/Cython-$pkgver
  python2 setup.py install --root=$pkgdir

  mv $pkgdir/usr/bin/cygdb $pkgdir/usr/bin/cygdb2
  mv $pkgdir/usr/bin/cython $pkgdir/usr/bin/cython2
  mv $pkgdir/usr/bin/cythonize $pkgdir/usr/bin/cythonize2
}
