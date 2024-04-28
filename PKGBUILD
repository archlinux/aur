# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=chembl-webresource-client
pkgname=python-${_name,,}
pkgver=0.10.9
pkgrel=2
pkgdesc='Python client fot accessing ChEMBL webservices.'
arch=('any')
url="https://www.ebi.ac.uk/chembl/api/data/docs"
license=('Apache')
depends=('python>=3.8' 'python-easydict' 'python-urllib3' 'python-requests>=2.18.4' 'python-requests-cache>=1.2')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('99101cad1ad178c5a0d7d74d70923c7997e9e63ec0361c247c6252dc29e524b5')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
