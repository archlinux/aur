# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-globre
_pkgname=globre
pkgver=0.1.5 
pkgrel=2
pkgdesc="A glob matching library, providing an interface similar to the "re" module."
url="https://pypi.org/project/globre/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ee214204f237e9114b8f61eeb61c2abd1e665ca3b59e5a6a0b070971c0bb12e2')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
