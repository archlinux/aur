# Maintainer: Matthias gatto <matthias.gatto@outscale.com>
# Reference: PKGBUILD(5)

pkgname=osc-sdk-python
pkgver=0.31.0
pkgrel=1
pkgdesc='Outscale Python 3 SDK'

arch=('any')
url='https://github.com/outscale/osc-sdk-python'
license=(BSD)

makedepends=('python-setuptools')
depends=(python-ruamel-yaml python-requests)

_project=osc_sdk_python
source=("https://files.pythonhosted.org/packages/cc/ac/5a92c25b8f98c647338b412471878d12cb5c9334edc31c52acb69bb157cf/osc_sdk_python-0.31.0.tar.gz")
sha256sums=("0c5e2b793077458df6a288522dcbc12cf779e7775d91cac7ba67c60fcda3d16f")

provides=("osc-sdk-python=${pkgver}")

build() {
    cd $_project-$pkgver
    python setup.py build
}

package() {
    cd $_project-$pkgver
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
