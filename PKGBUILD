# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: XavierCLL

pkgname=python-pympler
_realname_=Pympler
pkgver=0.6
pkgrel=1
pkgdesc="A development tool to measure, monitor and analyze the memory behavior of Python objects"
url="https://pypi.org/project/${_realname_}/"
arch=("any")
license=("Apache")
depends=("python")
source=("https://files.pythonhosted.org/packages/d4/5b/73d780a6b3939a8a53fc6db85a8d9eb41be718e7185f6cea534dbd1e1657/${_realname_}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py build
}

package() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py install --root="${pkgdir}/" --optimize=1
	#install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('a779eac1fbd532cc65ffa9126cbbf1beac8e4936')
