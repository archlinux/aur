# Contributor: Yuri Iozzelli <y.iozzelli@gmail.com>
# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=llvmlite
_pkgname="python-${_name}"
pkgname="${_pkgname}-bin"
pkgver=0.46.0
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
	"https://files.pythonhosted.org/packages/c9/19/5018e5352019be753b7b07f7759cdabb69ca5779fea2494be8839270df4c/${_wheel}"
)
sha256sums=('379fdd1c59badeff8982cb47e4694a6143bec3bb49aa10a466e095410522064d')
conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
	python -m installer --destdir="$pkgdir" "${srcdir}/${_wheel}"
}
