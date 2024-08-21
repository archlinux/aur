# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-diffpy.structure
pkgshort=diffpy.structure
pkgver=3.2.0
pkgrel=3
pkgdesc="Storage and manipulation of crystal structure data in python"
arch=('any')
url="https://www.diffpy.org/diffpy.structure/"
license=('Open Source Licensce Agreement')

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

md5sums=('b66fe66660108e72897a20d2e8722bd9')
