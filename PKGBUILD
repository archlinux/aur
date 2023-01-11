# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/python-wakatime
_source_type=pypi-releases
_upstreamver='0.0.1'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="wakatime plugin for python"
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
depends=('wakatime')
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('545a054b0b36ab5a2f2f204fda3ca4c29b509a0abdb5b572252481b482d3e788')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
