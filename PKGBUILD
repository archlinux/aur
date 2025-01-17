# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=brokenaxes
pkgname=python-${_name,,}
pkgver=0.6.2
pkgrel=1
pkgdesc='Create broken axes'
arch=('any')
url="https://github.com/bendichter/brokenaxes"
license=('MIT')
depends=('python>=3.8'
	'python-matplotlib>3.6')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=(bc0a269c4a9a9a643504fbb7d734a279629cc2cada5ee90c57645e75c89f38ad)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
