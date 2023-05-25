# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=YuriyLisovskiy/pynotifier
_source_type=pypi-releases
_upstreamver='0.5.0'
_pkgname=py-notifier
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Cross-platform desktop push-notifications."
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
depends=(libnotify)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('cb75a4ae1ed7839b5794dc94c0dd5b38e791c32f53041e99c64f71d9a1dfb8d3')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
