# Contributor: Yuri Iozzelli <y.iozzelli@gmail.com>
# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=llvmlite
_pkgname="python-${_name}"
pkgname="${_pkgname}-bin"
pkgver=0.47.0
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
_wheel="llvmlite-$pkgver-cp314-cp314-manylinux2014_x86_64.manylinux_2_17_x86_64.whl"
source=(
	"https://files.pythonhosted.org/packages/64/1d/a760e993e0c0ba6db38d46b9f48f6c7dceb8ac838824997fb9e25f97bc04/${_wheel}"
)
sha256sums=('ddbccff2aeaff8670368340a158abefc032fe9b3ccf7d9c496639263d00151aa')
conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
	python -m installer --destdir="$pkgdir" "${srcdir}/${_wheel}"
}
