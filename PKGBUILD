# Maintainer: Will Handley <wh260@cam.ac.uk>

pkgname=python-outlines-core
_pkgname=outlines_core
pkgver=0.2.14
pkgrel=1
pkgdesc="Structured Text Generation in Rust"
arch=(x86_64)
url="https://github.com/dottxt-ai/outlines-core"
license=(Apache-2.0)
depends=(
  python
)
makedepends=(
  python-installer
)
_pytag="cp$(python -c 'import sys; print(f"{sys.version_info[0]}{sys.version_info[1]}")')"
_wheel="${_pkgname}-${pkgver}-${_pytag}-${_pytag}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=("https://files.pythonhosted.org/packages/d5/63/dfa000239e46f17b47e6dc9bec3aab8a8136fe400312f1916320e02c8f38/${_wheel}")
noextract=("${_wheel}")
sha256sums=('d1776ae984574461f249fe590314a439992eb9b883f4091b8fa7fc56f29f3717')

package() {
  python -m installer --destdir="${pkgdir}" "${_wheel}"
}
