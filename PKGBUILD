# Maintainer: gilcu3
# Contributor: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=python-tokenizers-bin
_pkgname=tokenizers
pkgver=0.23.3
pkgrel=1
pkgdesc="Fast state-of-the-art tokenizers optimized for research and production (official wheel)"
arch=('x86_64' 'aarch64')
url="https://github.com/huggingface/tokenizers"
license=('Apache-2.0')
depends=('python' 'python-huggingface-hub')
makedepends=('python-installer')
provides=("python-tokenizers=$pkgver")
conflicts=('python-tokenizers')
options=('!strip')
_whl_x86_64="$_pkgname-$pkgver-cp310-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
_whl_aarch64="$_pkgname-$pkgver-cp310-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
source_x86_64=("https://files.pythonhosted.org/packages/cp310/${_pkgname::1}/$_pkgname/$_whl_x86_64")
source_aarch64=("https://files.pythonhosted.org/packages/cp310/${_pkgname::1}/$_pkgname/$_whl_aarch64")
noextract=("$_whl_x86_64" "$_whl_aarch64")
sha256sums_x86_64=('376851d22bcf9d650a5c3090bb83e6cf9e895fbf0595369fa4cd43c1f69b5f87')
sha256sums_aarch64=('ec82e80e65a862275b97c3d90b7a523df8d9519ee48aeb4e9625b2cc909274e0')

package() {
  local _whl="_whl_${CARCH}"
  python -m installer --destdir="$pkgdir" "$srcdir/${!_whl}"
}
