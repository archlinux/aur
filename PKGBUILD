# Maintainer:  cucullus <cucullus AT mail . ru>
_origpkgname=obspy
pkgname=python-$_origpkgname
pkgver=1.2.2
pkgrel=1
pkgdesc='A Python framework for processing seismological data'
arch=(x86_64)
url="http://obspy.org/"
license=('LGPL3')
depends=("python-scipy" "python-matplotlib" 'python-lxml' 'python-sqlalchemy' 'python-future' 'python-requests')
optdepends=('python-cartopy: recommended for map plotting'
	    'python-basemap>=1.0.2: legacy alternative to cartopy')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
sha256sums=('e0b9762be45d22ebdcf90e7742bdb419d92b90dc9e3ce6fd0a8fd145dcdf916e')

build() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
