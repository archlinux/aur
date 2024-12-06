# Contributor: Yuri Iozzelli <y.iozzelli@gmail.com>
# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=llvmlite
_pkgname="python-${_name}"
pkgname="${_pkgname}-bin"
pkgver=0.43.0
pkgrel=2
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
_wheel="${_name}-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=(
	"https://files.pythonhosted.org/packages/00/5f/323c4d56e8401c50185fd0e875fcf06b71bf825a863699be1eb10aa2a9cb/${_wheel}"
)
sha256sums=('df6509e1507ca0760787a199d19439cc887bfd82226f5af746d6977bd9f66844')
conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
	python -m installer --destdir="$pkgdir" "${srcdir}/${_wheel}"
}
