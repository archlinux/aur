# Maintainer: Chris Lea <chris.lea@gmail.com>

_basename=telnetlib_313_and_up
pkgname="python-${_basename}"
pkgver=3.13.1
pkgrel=1
pkgdesc="A copy of telnetlib for python 3.13+"
arch=('any')
url="https://pypi.org/project/telnetlib-313-and-up/"
license=('PSF-2.0')
depends=('python>=3.13.1')
#source=("https://files.pythonhosted.org/packages/b0/39/41a04bc6a978f590c4d20d4a44a3e6351b92d5e39009ad4fd5eb238ef45b/${_basename}-${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_basename::1}/${_basename//-/_}/${_basename//-/_}-$pkgver.tar.gz")
sha256sums=('93cdf0a35e8b6463853e5bfa134288a9695c7b69b9e6f4bcfb71c0888470288a')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)

build() {
    cd ${_basename}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_basename}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
