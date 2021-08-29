# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
pkgname=python-spython
_pkgname=spython
pkgver=0.1.15
pkgrel=1
pkgdesc="Singularity Python a Python API to work with the Singularity open source software"
arch=('any')
url="https://singularityhub.github.io/singularity-cli/"
license=('MPL2')
depends=('python')
optdepends=('singularity-container: to use and manipulate Singularity Containers')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('7674b8b9b3b2e723e5754849985bd668c8056f9d79ff019ba6f4237c70e15367')

build() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
