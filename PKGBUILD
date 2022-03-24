# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=pytorch_influence_functions
pkgname=python-pytorch-influence-functions
pkgver=0.1.1
pkgrel=1
pkgdesc='PyTorch reimplementation of Influence Functions'
arch=(any)
url='https://github.com/nimarb/pytorch_influence_functions'
license=(GPL)
depends=(python-pytorch)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('1583d8153f16ed204b68fb9b57827c5d57300185fb318f9f7216d37ddf3cc287e24c330282123c959e1c3282753b2199751372605b82d3bc19f22444faa598e5')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	# install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
