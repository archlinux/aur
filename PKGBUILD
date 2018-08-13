# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
pkgname=python-spython
_pkgname=spython
pkgver=0.0.38
pkgrel=1
pkgdesc="Singularity Python is a Python API to work with the Singularity open source software"
arch=('any')
url="https://singularityhub.github.io/singularity-cli/"
license=('AGPL3')
depends=('python')
optdepends=('singularity-container: to use and manipulate Singularity Containers')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('31f1f82b968195edfe43d5fa380034f88d66b29550a08ccc809df26190457346')

build() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
