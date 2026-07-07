# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nnote
pkgver=0.3.5
pkgrel=2
pkgdesc="A plain, file-based note-taking CLI"
arch=('any')
url="https://github.com/stiermid/nnote"
license=('GPL-3.0-or-later')
depends=(python python-click python-pyyaml)
makedepends=(python-build python-installer python-wheel python-flit-core)
provides=("python-$pkgname")
conflicts=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('db77876791ea4d5fdbd91b4bc18d652073a30bfc683a14cabe1048092aa32f69')

build() {
    cd "${pkgname}-${pkgver}"
    python3 -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
