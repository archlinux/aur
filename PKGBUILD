# Maintainer: pychuang at pm dot me
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=globus-cli
pkgver=3.30.1
pkgrel=1
pkgdesc='A command line interface to Globus'
arch=('any')
url='https://github.com/globus/globus-cli'
license=('Apache-2.0')
depends=(
    'python-globus-sdk=3.44.0'
    'python-click<9'
    'python-jmespath=1.0.1'
    'python-packaging>=17.0'
    'python-requests'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/globus/globus-cli/archive/${pkgver}.tar.gz")
sha256sums=('19a45af9189fd2c323adbc0c8439a3387ddeb44b444ed7af900de695cb9e2425')


build() {
    cd ${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}


package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir "$pkgdir" dist/*.whl
}
