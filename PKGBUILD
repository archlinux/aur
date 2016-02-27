_pkgname=obspy
pkgname=python-$_pkgname
pkgver=1.0.0
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
md5sums=('c75479c99499559a21cecd6899ab395c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
