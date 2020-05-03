# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
pkgname=python-spython
_pkgname=spython
pkgver=0.0.80
pkgrel=1
pkgdesc="Singularity Python a Python API to work with the Singularity open source software"
arch=('any')
url="https://singularityhub.github.io/singularity-cli/"
license=('MPL2')
depends=('python')
optdepends=('singularity-container: to use and manipulate Singularity Containers')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e4eddd6f439fe9a9a0f6566e13d89ff096397f86043c50a8d8dcfc87e7b4d686')

build() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
