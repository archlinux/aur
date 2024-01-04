# Maintainer: Tomasz Zok <tomasz (dot) zok (at) gmail (dot) com>
pkgname=python-crossref-commons
_name=${pkgname#python-}
_name=${_name/-/_}
pkgver=0.0.7
pkgrel=2
pkgdesc='High-level library for getting data from Crossref APIs (REST, XML, ...)'
arch=('any')
url='https://gitlab.com/crossref/crossref_commons_py'
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python-ratelimit python-requests)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('d819e8321a4713e7088237833002ab9e2f4b904c542c818b05af9543091bd957d67d290696ee6cc820b905d3dc2b735d117101352e2c67b5e768784e66808411')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
