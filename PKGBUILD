# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=scales
pkgname=python-${_name}
pkgdesc="Stats for Python processes."
pkgver=1.0.9
pkgrel=1
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-six')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-flask' 'python-twisted' 'python-bottle' 'python-tornado')
url="https://github.com/Cue/scales"
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8b6930f7d4bf115192290b44c757af5e254e3fcfcb75ff9a51f5c96a404e2753')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
