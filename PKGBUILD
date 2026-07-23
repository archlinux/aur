# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-python-app
_name=${pkgname//-/_}
pkgver=0.2.11
pkgrel=1
pkgdesc="Composable scaffolding CLI for production-ready Python apps"
arch=('any')
url="https://github.com/Create-Python-App/create-python-app"
license=('MIT')
depends=('python>=3.12')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${pkgname}/${_name}-${pkgver}.tar.gz")
sha256sums=('98bf74a2f443fdeeea8a25edfcee4f9d8cd0cdf6ca18e090104e9ee8abd00412')

package() {
  # Install the published sdist with its PyPI dependencies (parity with
  # CNA's `npm install -g` of the npm tarball).
  PIP_CONFIG_FILE=/dev/null python -m pip install \
    --root="${pkgdir}" \
    --prefix=/usr \
    --no-warn-script-location \
    "${srcdir}/${_name}-${pkgver}.tar.gz"
}
