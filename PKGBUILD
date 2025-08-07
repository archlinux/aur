# Maintainer: ThePirate42 <aur at thepirate42 dot org>

_name=ju

pkgname=python-${_name}
pkgver=0.1.27
pkgrel=1
pkgdesc="JSON schema Utils"
arch=('any')
url="https://github.com/i2mint/${_name}"
license=('Apache-2.0')
depends=(python python-importlib_resources python-dol python-i2 python-pydantic python-glom python-traitlets python-ipywidgets python-requests datamodel-code-generator)
makedepends=(python-build python-installer python-setuptools)
source=(${_name}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('12e6e7f54043876ad38afc9c3ebbb044caaf93a1b547ad2ebc4d5c8560df0f9d22cd4d96552bda82c12871489b7d933bf764fb32cc9ab038ba4a54cec33a02ba')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
