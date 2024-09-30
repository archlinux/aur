# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: XavierCLL

_filename_=pympler
pkgname=python-${_filename_}
_realname_=Pympler
pkgver=1.1
pkgrel=1
pkgdesc="A development tool to measure, monitor and analyze the memory behavior of Python objects"
url="https://pypi.org/project/${_realname_}/"
arch=("any")
license=("Apache")
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/dd/37/c384631908029676d8e7213dd956bb686af303a80db7afbc9be36bc49495/${_filename_}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}"/${_filename_}-${pkgver}

	python setup.py build
}

package() {
	cd "${srcdir}"/${_filename_}-${pkgver}

	python setup.py install --root="${pkgdir}/" --optimize=1
	#install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('1eaa867cb8992c218430f1708fdaccda53df064144d1c5656b1e6f1ee6000424')
