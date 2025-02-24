# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-matplotlib-scalebar
pkgshort=matplotlib-scalebar
pkgver=0.9.0
pkgrel=2
pkgdesc="Provides a new artist for matplotlib to display a scale bar, aka micron bar."
arch=('any')
url="https://github.com/ppinard/matplotlib-scalebar"
license=('BSD-2-Clause')

depends=('python'
         'python-matplotlib'
         )

makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-hatch-vcs'
             )

provides=('matplotlib-scalebar')

source=(https://github.com/ppinard/matplotlib-scalebar/archive/refs/tags/$pkgver.tar.gz)

build() { 
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
md5sums=('f4eb67fe49a958c335c306aa021b7e97')
