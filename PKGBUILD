# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nnote
pkgver=0.3.3
pkgrel=2
pkgdesc="A plain, file-based note-taking CLI"
arch=('any')
url="https://github.com/stiermid/nnote"
license=('GPL-3.0-or-later')
depends=(python python-click python-pyyaml)
makedepends=(python-build python-installer python-wheel python-uv-build)
provides=("python-$pkgname")
conflicts=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9eba377079db190c020e5245857b14154d8862af2f23073162d8dd5c39cc85de')

build() {
    cd "${pkgname}-${pkgver}"
    python3 -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
