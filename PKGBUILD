# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=nnote
pkgver=0.3.4
pkgrel=1
pkgdesc="A plain, file-based note-taking CLI"
arch=('any')
url="https://github.com/stiermid/nnote"
license=('GPL-3.0-or-later')
depends=(python python-click python-pyyaml)
makedepends=(python-build python-installer python-wheel python-uv-build)
provides=("python-$pkgname")
conflicts=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('05f4c79e4952f166329cde1cddae117814d6d43b4d480e0235a444dbc200a648')

build() {
    cd "${pkgname}-${pkgver}"
    python3 -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
