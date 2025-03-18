# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-py3dtiles
_pkgname=py3dtiles
pkgver=9.0.0
pkgrel=2
pkgdesc="Python module to manage 3DTiles format"
arch=('any')
url="https://gitlab.com/$_pkgname/$_pkgname"
license=('Apache 2.0')
depends=('python-earcut' 'python-lz4' 'python-numba' 'python-numpy' 'python-pyproj' 'python-pyzmq' 'python-pygltflib' 'python-laspy' 'python-plyfile' 'python-psycopg2')
makedepends=('git' 'python-setuptools')
#https://gitlab.com/py3dtiles/py3dtiles/-/archive/v9.0.0/py3dtiles-v9.0.0.tar.gz
source=("$_pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('3ef8149d82b9fcc58d0af7312d307f8f27f2a765beef7ddf603c094125ef007c')

#build() {
#  cd "$srcdir/$_pkgname-$pkgver"
#  python -m build --wheel --skip-dependency-check --no-isolation
#}

package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_pkgname
}
#package() {
#  cd "$srcdir/$_pkgname-$pkgver"
#  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
#
#  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
#  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
#  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
#}
