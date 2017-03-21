_origpkgname=obspy
pkgname=python-$_origpkgname
pkgver=1.0.3
pkgrel=1
pkgdesc='A Python framework for processing seismological data'
arch=('i686' 'x86_64')
url="http://obspy.org/"
license=('LGPL3')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-lxml' 'python-sqlalchemy' 'python-future' 'python-requests')
optdepends=('python-basemap: for plotting maps'
            'python-suds-jurko: for obspy.neries')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
md5sums=('33d258c45a48974887d4a7c155259f7a')

build() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
