# Maintainer: Chris Lea <chris.lea@gmail.com>

_basename="telnetlib-313-and-up"
pkgname="python-${_basename}"
pkgver=3.13.1
pkgrel=3
pkgdesc="A copy of telnetlib for python 3.13+"
arch=('any')
url="https://pypi.org/project/telnetlib-313-and-up/"
license=('PSF-2.0')
depends=('python>=3.13.1')
source=("https://files.pythonhosted.org/packages/source/${_basename::1}/${_basename//-/_}/${_basename//-/_}-$pkgver.tar.gz")
sha256sums=('93cdf0a35e8b6463853e5bfa134288a9695c7b69b9e6f4bcfb71c0888470288a')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)

build() {
    cd ${_basename//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_basename//-/_}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
