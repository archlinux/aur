# Maintainer:  cucullus <cucullus AT mail . ru>
pkgname=python-obspy
pkgver=1.4.1
pkgrel=2
pkgdesc='A Python framework for processing seismological data'
arch=(x86_64)
url="http://obspy.org/"
license=('LGPL-3.0-only')
depends=("python-scipy" "python-matplotlib" 'python-lxml' 'python-sqlalchemy1.4' 'python-suds')
optdepends=('python-cartopy>=0.20: map plotting')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
sha256sums=('fc4c919f4d775e23717d9c5e0aa08f6927da9a2bec0a004929bacb1c56f4ce98')

build() {
    cd "$srcdir/obspy-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/obspy-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
