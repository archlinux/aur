_origpkgname=obspy
pkgname=python-$_origpkgname
pkgver=1.1.1
pkgrel=1
pkgdesc='A Python framework for processing seismological data'
arch=('x86_64')
url="http://obspy.org/"
license=('LGPL3')
depends=('python-scipy' 'python-matplotlib' 'python-lxml' 'python-sqlalchemy' 'python-future' 'python-requests' 'python-decorator')
optdepends=('python-basemap: plotting on the map'
			'python-suds-jurko: for obspy.neries')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
md5sums=('ae7b75055a1de926f80d4818a60a127c')

build() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
