# Maintainer: redponike <proton (dot) me>
# Contributor: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=lucidrains/x-transformers
_pkgname=${_repo##*/}
_pypi_package=$_pkgname
_source_type=pypi-releases
_upstreamver='2.1.1'

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="A simple but complete full-attention transformer with a set of promising experimental features from various papers"
arch=(any)
url=https://github.com/$_repo
depends=(python-einops python-einx python-pytorch python-packaging python-loguru)
makedepends=(python-installer)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('a2e1eb1047b739a5dffcda76e593ed663828dd6c6968c25551f42d2ca9d3b5f1')

package() {
  cd "$srcdir" || return 1
  python -m installer --destdir="$pkgdir" ./*.whl
}
