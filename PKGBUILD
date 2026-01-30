# SPDX-License-Identifier: 0BSD
# Maintainer: Emma Welker <code@nuew.net>
_name=factorio-rcon
pkgname="python-${_name}"
pkgver=2.1.3
pkgrel=1
pkgdesc="RCON client for Factorio servers"
arch=(x86_64)
url="https://github.com/mark9064/factorio-rcon-py"
license=(LGPL-2.1-only)
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('python-anyio: async support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('eea945b90b21d4bcac5cde59b4149a8d9bc8f4d7d264880880316139e5e44a3b')

build() {
    cd "${_name}-py-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-py-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
