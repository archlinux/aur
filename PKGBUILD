_origpkgname=obspy
pkgname=python-$_origpkgname
pkgver=1.1.0
pkgrel=2
pkgdesc='A Python framework for processing seismological data'
arch=('i686' 'x86_64')
url="http://obspy.org/"
license=('LGPL3')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-lxml' 'python-sqlalchemy' 'python-future' 'python-requests' 'python-decorator')
optdepends=('python-basemap: for plotting maps'
            'python-suds-jurko: for obspy.neries')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
md5sums=('dd00b8edd5ad6dc3c74cd5656a560fd2')

build() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
