# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=YuriyLisovskiy/pynotifier
_source_type=pypi-releases
_upstreamver='0.3.2'
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
sha256sums=('c22a577e0b8ecb73e93d545489d3c65cc50e96fa9348885602fcd20a44f05909')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
