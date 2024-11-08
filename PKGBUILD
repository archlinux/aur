# Maintainer: KiWi42 < pullthisplug dash aur at yahoo dot com >
# Contributor: algebro

pkgname=python-libnmap
pkgver=0.7.3
pkgrel=2
pkgdesc="Python NMAP library for starting async nmap tasks, parsing and comparing scan results."
arch=("any")
url="https://github.com/savon-noir/python-libnmap"
license=("Apache-2.0")
depends=("python")
optdepends=("python-boto" "python-defusedxml" "python-pymongo" "python-sqlalchemy")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("d03629256c2ee9ab37390c28d4c4c2ae9637cd0861dd8ab9e0f32779545936c0")

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
