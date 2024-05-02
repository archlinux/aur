# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-holospy
pkgshort=holospy
pkgver=0.3
pkgrel=1
pkgdesc="Analysis of (off-axis) electron holography data with HyperSpy"
arch=('any')
url="http://hyperspy.org/holospy"
license=('GPL3')

depends=('python'
         'python-hyperspy>=2.0rc0'
         'python-numpy>=1.20.0'
         'python-scipy>=1.5.0'
         )

makedepends=('python-setuptools'
             'python-setuptools-scm')

provides=('holospy')

source=(https://github.com/hyperspy/$pkgshort/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

md5sums=('13af6a87a69580ab553bd43c9d65dd2a')
