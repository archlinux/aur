# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: XavierCLL

pkgname=python-pympler
_realname_=Pympler
pkgver=0.9
pkgrel=1
pkgdesc="A development tool to measure, monitor and analyze the memory behavior of Python objects"
url="https://pypi.org/project/${_realname_}/"
arch=("any")
license=("Apache")
depends=("python")
source=("https://files.pythonhosted.org/packages/e8/e2/2f3a086701bb62b1c478a3921836271177838a3c98cdc6b82c3bb36d3854/${_realname_}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py build
}

package() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py install --root="${pkgdir}/" --optimize=1
	#install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('f2cbe7df622117af890249f2dea884eb702108a12d729d264b7c5983a6e06e47')
