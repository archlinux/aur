_name=medium
pkgname="python-${_name}"
pkgver=0.3.0
pkgrel=1
pkgdesc="A Python wrapper for the Medium API"
url="https://github.com/Medium/medium-sdk-python"
arch=("any")
license=("MIT")
depends=("python" "python-requests")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0712a3e6c99467c97a46b0c7ef6ba0dec079018fc40f6093dc98d95c05ece7fd')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
