# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=google/latexify_py
_pkgname=${_repo##*/}
_pypi_package=$_pkgname
_source_type=pypi-releases
_upstreamver='0.2.0'

pkgname=python-${_pkgname//_/-}
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="A library to generate LaTeX expression from Python code."
arch=(any)
url=https://github.com/$_repo
depends=(python-dill)
makedepends=(python-installer)
license=(ApacheV2)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('a661528e334e51d83e9bc552f54776f11862261a04de9cdbbd5b5667ccbca423')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
