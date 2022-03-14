# Maintainer:  cucullus <cucullus AT mail . ru>
_origpkgname=obspy
pkgname=python-$_origpkgname
pkgver=1.3.0
pkgrel=1
pkgdesc='A Python framework for processing seismological data'
arch=(x86_64)
url="http://obspy.org/"
license=('LGPL3')
depends=("python-scipy" "python-matplotlib" 'python-lxml' 'python-sqlalchemy' 'python-future' 'python-suds')
optdepends=('python-cartopy>=0.20: map plotting')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
sha256sums=('12a5ba9cae3445c9f31bd0e0561e791bc755cc627d4412f851f6286fef82be34')

build() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_origpkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
