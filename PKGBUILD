# Maintainer: Tim Henkes <me+aur@syndace.dev>

pkgname="python-oldmemo"
pkgver=2.1.0
pkgrel=1
pkgdesc="Backend implementation of the \`eu.siacs.conversations.axolotl\` namespace for python-omemo."
arch=("any")
url="https://github.com/Syndace/python-oldmemo"
license=("AGPL-3.0-only")
depends=(
    "python"
    "python-cryptography"
    "python-doubleratchet"
    "python-omemo"
    "python-protobuf"
    "python-typing_extensions"
    "python-x3dh"
    "python-xeddsa"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
optdepends=("python-xmlschema: etree-based XML (de)serialization and validation")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Syndace/python-oldmemo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("a925e921cc1cf0e203a8090b10898264cd89299087faf91893ef98b6140bc5ed")

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
