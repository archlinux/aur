# Contributor: Yuri Iozzelli <y.iozzelli@gmail.com>
# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=llvmlite
_pkgname="python-${_name}"
pkgname="${_pkgname}-bin"
pkgver=0.44.0
pkgrel=1
epoch=
pkgdesc="A lightweight LLVM python binding for writing JIT compilers (with SVML support!)"
arch=("x86_64")
url="http://llvmlite.pydata.org"
license=('GPL')
depends=("python")
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
)
# https://pypi.org/project/llvmlite/#files
_wheel="llvmlite-0.44.0-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=(
	"https://files.pythonhosted.org/packages/d2/1b/656f5a357de7135a3777bd735cc7c9b8f23b4d37465505bd0eaf4be9befe/${_wheel}"
)
sha256sums=('46224058b13c96af1365290bdfebe9a6264ae62fb79b2b55693deed11657a8bf')
conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
	python -m installer --destdir="$pkgdir" "${srcdir}/${_wheel}"
}
