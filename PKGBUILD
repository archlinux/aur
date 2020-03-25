# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=('python-trimesh' 'python2-trimesh')
_name=trimesh
pkgver=3.6.15
pkgrel=1
pkgdesc="Trimesh is a pure Python (2.7-3.4+) library for loading and using triangular meshes with an emphasis on watertight surfaces."
arch=('any')
url="https://github.com/mikedh/trimesh"
license=('MIT')
depends=()
makedepends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('30b53c66165c2c7e79968e9b9c083f52')


build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package_python-trimesh() {
  depends+=('python-numpy')
  optdepends+=(
    'python-networkx: graph operations'
    'python-pyembree: faster ray queries'
    'python-pyglet: preview windows'
    'python-rtree: vector path handling'
    'python-scipy: convex hulls'
    'python-shapely: vector path handling'
    'python-xxhash: faster cache checks')
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-trimesh() {
  depends+=('python2-numpy')
  optdepends+=(
    'python2-networkx: graph operations'
    'python2-pyembree: faster ray queries'
    'python2-pyglet: preview windows'
    'python2-rtree: vector path handling'
    'python2-scipy: convex hulls')
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


# vim:set ts=2 sw=2 et:
