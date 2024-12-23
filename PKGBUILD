# Maintainer: devome <evinedeng@hotmail.com>
# Contributor:  Liam Timms <timms5000@gmail.com>
# Contributor: mark.blakeney at bullet-systems dot net

_pkgname=looseversion
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.3.0
pkgrel=1
pkgdesc="Version numbering for anarchists and software realists"
arch=('any')
url='https://github.com/effigies/looseversion'
license=('PSF-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('ebde65f3f6bb9531a81016c6fef3eb95a61181adc47b7f949e9c0ea47911669e')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
