# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
pkgname=python-py3_sg
_pkgname=py3_sg
pkgver=0.13
_commit=ceea144c35a754c60e476de88bd10697901ba55e
pkgrel=1
pkgdesc='Python3 SCSI generic library'
arch=('any')
url='https://github.com/crypto-universe/py3_sg'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python')
source=("$_pkgname.zip::https://github.com/crypto-universe/$_pkgname/archive/$_commit.zip")
sha256sums=('35ec783ec06818587640162b1e0b94ada7faadcc6d755c1a266ac02c242e7e51')
b2sums=('1e507124e05c608852501b8e108acafa08ec2e6b83ac397ac752ab3975df69eea4958d8386617aa5b78fc1f5127a2bd232c49b18c1757c977cae50128d3b8ef7')

build() {
	cd "${srcdir}/${_pkgname}-${_commit}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${_commit}"
	python setup.py install --root="${pkgdir}" \
	--prefix='/usr' \
	--compile -O1
}
