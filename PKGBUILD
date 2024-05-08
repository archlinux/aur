# Maintainer: Martin Rys <rys.rs/contact>

pkgname=python-jxlpy
_reponame=jxlpy
pkgver=0.9.5
pkgrel=1
pkgdesc="Module for reading and writing support for JPEG XL directly from Python"
url="https://github.com/olokelo/jxlpy"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('libjxl' 'python' 'python-pillow')
makedepends=('python-setuptools' 'cython' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/olokelo/jxlpy/archive/${pkgver}.tar.gz")
sha256sums=('a1884ce5ffc908d856a82b8acfa54ba2ed986533e9d50f00a512e5351bf9e7a3')

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
