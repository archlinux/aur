# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-diffpy.structure
pkgshort=diffpy.structure
pkgver=3.2.1
pkgrel=1
pkgdesc="Storage and manipulation of crystal structure data in python"
arch=('any')
url="https://www.diffpy.org/diffpy.structure/"
license=('BSD-3-Clause')

depends=('python'
         'python-six'
         'python-pycifrw>=4.4.3'
         )

makedepends=('python-setuptools'
             'python-setuptools-git-versioning<2'
             )

provides=('diffpy.structure')

source=(https://github.com/diffpy/diffpy.structure/archive/$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

md5sums=('9dfbd923fb4f80a894421ced7ba1c8eb')
