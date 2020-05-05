_origpkgname=obspy
pkgname=python-$_origpkgname
pkgver=1.2.1
pkgrel=1
pkgdesc='A Python framework for processing seismological data'
arch=('any')
url="http://obspy.org/"
license=('LGPL3')
depends=("python-scipy" "python-matplotlib" 'python-lxml' 'python-sqlalchemy' 'python-future' 'python-requests')
optdepends=('python-cartopy: recommended for map plotting'
	    'python-basemap>=1.0.2: legacy alternative to cartopy')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
md5sums=('2c924b5dc30d3ea560d137fb1d185552')

build() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
