# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=lucidrains/x-transformers
_pkgname=${_repo##*/}
_pypi_package=$_pkgname
_source_type=pypi-releases
_upstreamver='1.2.3'

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="A simple but complete full-attention transformer with a set of promising experimental features from various papers"
arch=(any)
url=https://github.com/$_repo
depends=(python-einops python-pytorch)
makedepends=(python-installer)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('099de097586f4f2823510a67d455a8ab726ef693adf20227afc9166220d2ad69')

package() {
  cd "$srcdir" || return 1
  python -m installer --destdir="$pkgdir" ./*.whl
}
