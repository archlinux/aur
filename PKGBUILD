# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-jxlpy
_reponame=jxlpy
pkgver=0.9.3
pkgrel=1
pkgdesc="Module for reading and writing support for JPEG XL directly from Python"
url="https://github.com/olokelo/jxlpy"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('libjxl' 'python' 'python-pillow')
makedepends=('python-setuptools' 'cython' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/olokelo/jxlpy/archive/${pkgver}.tar.gz")
sha256sums=('fbc92621ff57742291d73e791e396d4d6e2f3dd39efd77ad3bc8d795390ce9f2')

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
