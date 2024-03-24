# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-jxlpy
_reponame=jxlpy
pkgver=0.9.4
pkgrel=1
pkgdesc="Module for reading and writing support for JPEG XL directly from Python"
url="https://github.com/olokelo/jxlpy"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('libjxl' 'python' 'python-pillow')
makedepends=('python-setuptools' 'cython' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/olokelo/jxlpy/archive/${pkgver}.tar.gz")
sha256sums=('74f8380892ce4828fe616c2d78277d5f1c8fe9322cdc4549fd7541f4b239d56d')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py install --root="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
