# Contributor: Yuri Iozzelli <y.iozzelli@gmail.com>
# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=llvmlite
_pkgname="python-${_name}"
pkgname="${_pkgname}-bin"
pkgver=0.48.0
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
	"https://files.pythonhosted.org/packages/d6/e1/05b50692b647cac3c18200ac485b04f342f00ed173c9cc46767274469a15/${_wheel}"
)
sha256sums=('05f0103c8f2f96a37441337e3643863c01b8e83e530aff38960dcb383c54a065')
conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
	python -m installer --destdir="$pkgdir" "${srcdir}/${_wheel}"
}
