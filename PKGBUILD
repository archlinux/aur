# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D
pkgname=python-py3_sg
_pkgname=py3_sg
pkgver=0.0.2
pkgrel=1
pkgdesc='Python3 SCSI generic library'
arch=('any')
url='https://github.com/7aman/py3_sg'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('2d9813a1e95841d705176d7a4f3ae89cdc28bf7494e3ef4f171058679525a23d')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" \
	--prefix='/usr' \
	--compile -O1
}
