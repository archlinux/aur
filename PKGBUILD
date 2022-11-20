# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=casperdcl/argopt
_pkgname=${_repo##*/}
_pypi_package=$_pkgname
_source_type=pypi-releases
_upstreamver='0.7.1'

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="doc to argparse driven by docopt"
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
license=(MPL)
_py=py2.py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('94ca1828f95e007b738b1f93cb2112610f939dbdf687e4936d6e6d7b88c8bf8e')

package() {
  cd "$srcdir" || return 1
  python -m installer --destdir="$pkgdir" ./*.whl
}
