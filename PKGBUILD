# Maintainer: Matthias gatto <matthias.gatto@outscale.com>
# Reference: PKGBUILD(5)

pkgname=osc-sdk-python
pkgver=0.27.0
pkgrel=1
pkgdesc='Outscale Python 3 SDK'

arch=('any')
url='https://github.com/outscale/osc-sdk-python'
license=(BSD)

makedepends=('python-setuptools')
depends=(python-pip python-ruamel-yaml python-requests)

_project=osc_sdk_python
source=("https://files.pythonhosted.org/packages/source/${_project::1}/$_project/$_project-$pkgver.tar.gz")
sha256sums=("bce91af8d334ce5550442114b6950bbf528d9f4a3de50c844a4a430d5780f3aa")

build() {
    cd $_project-$pkgver
    python setup.py build
}

package() {
    cd $_project-$pkgver
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
