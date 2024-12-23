# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=easydict
pkgname=python-${_name,,}
pkgver=1.13
pkgrel=3
pkgdesc='Access dict values as attributes (works recursively).'
arch=('any')
url="https://github.com/makinacorpus/easydict"
license=('LGPL3')
depends=('python')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('6b787daf4dcaf6377b4ad9403a5cee5a86adbc0ca9a5bcf5410e9902002aeac2')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
