# Maintainer:  cucullus <cucullus AT mail . ru>
pkgname=python-obspy
pkgver=1.4.0
pkgrel=1
pkgdesc='A Python framework for processing seismological data'
arch=(x86_64)
url="http://obspy.org/"
license=('LGPL3')
depends=("python-scipy" "python-matplotlib" 'python-lxml' 'python-sqlalchemy' 'python-future' 'python-suds')
optdepends=('python-cartopy>=0.20: map plotting')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
sha256sums=('6f89a14713012bf59e9ef01f3efc89a86cd767c8f3f83c4aa9fafb2bec4f339e')

build() {
    cd "$srcdir/obspy-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/obspy-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
