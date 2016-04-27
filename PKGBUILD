_origpkgname=obspy
pkgname=python-$_origpkgname
pkgver=1.0.1
pkgrel=1
pkgdesc='A Python framework for processing seismological data'
arch=('i686' 'x86_64')
url="http://obspy.org/"
license=('LGPL3')
depends=("python-numpy>=1.6" "python-scipy>=0.9" "python-matplotlib>=1.1" 'python-lxml' 'python-sqlalchemy' 'python-future' 'python-requests')
optdepends=('python-basemap: recommended for plotting')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
md5sums=('3e97c00c117daf56246a8234344a0822')

build() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
