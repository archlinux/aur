# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-jxlpy
_reponame=jxlpy
pkgver=0.9.5
pkgrel=3
pkgdesc="Module for reading and writing support for JPEG XL directly from Python"
url="https://github.com/olokelo/jxlpy"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('libjxl' 'python' 'python-pillow')
makedepends=('python-build' 'python-installer' 'cython' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/olokelo/jxlpy/archive/${pkgver}.tar.gz")
sha256sums=('a1884ce5ffc908d856a82b8acfa54ba2ed986533e9d50f00a512e5351bf9e7a3')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	#pip install --root="${pkgdir}" dist/*.whl
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
