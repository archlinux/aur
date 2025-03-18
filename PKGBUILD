# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-pygltflib
_pkgname=pygltflib
pkgver=1.16.3
pkgrel=1
pkgdesc="Module for reading and writing basic gltf files."
arch=('any')
url="https://gitlab.com/dodgyville/$_pkgname"
license=('MIT')
depends=('python-dataclasses-json')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('deaca01ef008facb55332d63dba1f87cf00fbaaec989e72c538b50ed4d83aefb')

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
