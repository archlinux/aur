# Maintainer: gilcu3
# Contributor: gilcu3

pkgname="python-code-minimap"
pkgver=0.1.1
pkgrel=1
pkgdesc="Pure Python code minimap render"
arch=('any')
url="https://github.com/joouha/${pkgname}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b54623b9a10752ee016557bb1a63166c8015a765dfbcad0c4e496e9f0a132333')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  # local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
