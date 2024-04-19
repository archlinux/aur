# Maintainer: Senge Dev <sengedev@gmail.com>
# Contributor: Senge Dev <sengedev@gmail.com>

_pkgname=zhipuai
pkgname=python-${_pkgname}
pkgver=1.0.0
pkgrel=2
pkgdesc='ZhipuAI LLM API SDK for Python'
arch=(any)
url="https://pypi.org/project/${_pkgname}/"
license=(MIT)
depends=(python python-pyjwt python-httpx python-pydantic python-cachetools)
makedepends=(python-setuptools)
source=("${_pkgname}::git+https://github.com/MetaGLM/${_pkgname}-sdk-python-v4")
sha256sums=('SKIP')
install='zhipuai.install'
build() {
	cd "${_pkgname}"
	python setup.py build
}

package() {
	cd "${_pkgname}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

