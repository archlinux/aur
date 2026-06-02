# Maintainer: Danila Vershinin <ciapnz@gmail.com>
pkgname=python-ngxparse
_pyname=ngxparse
pkgver=0.5.16
pkgrel=1
pkgdesc="Reliable and fast NGINX configuration file parser (maintained fork of crossplane)"
arch=('any')
url="https://github.com/dvershinin/crossplane"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('33746d1693d93903ab0c2b37ba16b8a4743a2767b1959dc125a2417d253b7e3b')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
