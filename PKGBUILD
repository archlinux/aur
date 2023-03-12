# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: XavierCLL

pkgname=python-pympler
_realname_=Pympler
pkgver=1.0.1
pkgrel=1
pkgdesc="A development tool to measure, monitor and analyze the memory behavior of Python objects"
url="https://pypi.org/project/${_realname_}/"
arch=("any")
license=("Apache")
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/12/b7/9d17fbb2fde0b035dbd27e5d82dfbcd3fa990cf5a469cef8e89712d16113/${_realname_}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py build
}

package() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py install --root="${pkgdir}/" --optimize=1
	#install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('993f1a3599ca3f4fcd7160c7545ad06310c9e12f70174ae7ae8d4e25f6c5d3fa')
