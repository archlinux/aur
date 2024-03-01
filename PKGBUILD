# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=easydict
pkgname=python-${_name,,}
pkgver=1.12
pkgrel=1
pkgdesc='Access dict values as attributes (works recursively).'
arch=('any')
url="https://github.com/makinacorpus/easydict"
license=('LGPL3')
depends=('python')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('039efc4e476c130cdc4dac3807223abbdf233506420ed00b4beddc1569cfe360')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
