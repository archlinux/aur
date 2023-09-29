# Maintainer: Anakojm <https://anakojm.net/a-propos/#contact>

pkgname='python-mplug'
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="A plugin manager for mpv"
arch=('any')
url="https://pypi.org/project/$_name/"
license=('MPL-2.0')
depends=('python>=3.6.0' 'python-gitpython' 'python-requests' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
noextract=("${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('86af8db456b9da9eddb58b00f20470d293b32a47b6bf4e58408917d5b4a5b8e3')

# build() {
# Building gives weird errors:
# https://0x0.st/HVgr.png
# }

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
