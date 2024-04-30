# Maintainer: Matthias gatto <matthias.gatto@outscale.com>
# Reference: PKGBUILD(5)

pkgname=osc-sdk-python
pkgver=0.29.0
pkgrel=1
pkgdesc='Outscale Python 3 SDK'

arch=('any')
url='https://github.com/outscale/osc-sdk-python'
license=(BSD)

makedepends=('python-setuptools')
depends=(python-ruamel-yaml python-requests)

_project=osc_sdk_python
source=("https://files.pythonhosted.org/packages/source/${_project::1}/$_project/$_project-$pkgver.tar.gz")
sha256sums=("e606ded25dbe076f8ec2a452b177d185b3a542d7bfefc45997151b4e3a9bf961")

provides=("osc-sdk-python=${pkgver}")

build() {
    cd $_project-$pkgver
    python setup.py build
}

package() {
    cd $_project-$pkgver
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
