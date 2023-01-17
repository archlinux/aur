# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Harry24k/adversarial-attacks-pytorch
_source_type=pypi-releases
_upstreamver='3.3.0'
_pkgname=torchattacks
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="PyTorch implementation of adversarial attacks"
arch=(any)
url=https://github.com/$_repo
depends=(python-pytorch)
makedepends=(python-installer)
optdepends=(
	'python-scipy: support tifgsm'
)
license=(MIT)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('9065ab20c037ec1f2eab9fc0c44d32ec0961bffea11d8949fb1cb253010401fb')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
