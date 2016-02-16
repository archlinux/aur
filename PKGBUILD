_pkgname=obspy
pkgname=python-$_pkgname
pkgver=0.10.2
pkgrel=1
pkgdesc='A Python framework for processing seismological data'
arch=('i686' 'x86_64')
url="http://obspy.org/"
license=('LGPL3')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-lxml' 'python-sqlalchemy' 'python-future')
optdepends=('python-suds-jurko: for using obspy.neries'
    	    'python-basemap: recommended for plotting')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
md5sums=('48b7c72e11d59c5aa41eef0b14c6c987')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
