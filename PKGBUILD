# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-lumispy
pkgshort=lumispy
pkgver=0.3.0
pkgrel=1
pkgdesc="Luminescence spectroscopy data analysis extension for HyperSpy"
arch=('any')
url="http://lumispy.org"
license=('GPL3')

depends=('python>=3.9'
         'python-scipy>=1.1'
         'python-numpy>=1.17.1'
         'python-hyperspy>=1.7.3'
         )

makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
	     )

checkdepends=('python-numba'
              'python-pytest>=5.0'
              'python-pytest-cov'
              'python-setuptools-scm'
              )

provides=('lumispy')

source=(https://github.com/lumispy/lumispy/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

md5sums=('ca674e44f4e8c8edc9c9403f7bf10d3c')
