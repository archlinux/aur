# Contributor: Yuri Iozzelli <y.iozzelli@gmail.com>
# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=llvmlite
_pkgname="python-${_name}"
pkgname="${_pkgname}-bin"
pkgver=0.45.1
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
_wheel="llvmlite-$pkgver-cp313-cp313-manylinux2014_x86_64.manylinux_2_17_x86_64.whl"
source=(
	"https://files.pythonhosted.org/packages/f7/97/ad1a907c0173a90dd4df7228f24a3ec61058bc1a9ff8a0caec20a0cc622e/${_wheel}"
)
sha256sums=('57c48bf2e1083eedbc9406fb83c4e6483017879714916fe8be8a72a9672c995a')
conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
	python -m installer --destdir="$pkgdir" "${srcdir}/${_wheel}"
}
