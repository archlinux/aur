# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=python-tokenizers-bin
_pkgname=tokenizers
pkgver=0.23.1
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
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/huggingface/tokenizers/v$pkgver/LICENSE")
source_x86_64=("https://files.pythonhosted.org/packages/0d/d5/1353e5f677ec27c2494fb6a6725e82d56c985f53e90ec511369e7e4f02c6/tokenizers-$pkgver-cp310-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/6c/36/e006edf031154cba92b8416057d92c3abe3635e4c4b0aa0b5b9bb39dde70/tokenizers-$pkgver-cp310-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl")
noextract=("tokenizers-$pkgver-cp310-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
           "tokenizers-$pkgver-cp310-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('5075b405006415ea148a992d093699c66eb01952bf59f4d5727089a98bda45a4')
sha256sums_aarch64=('1bf13402aff9bc533c89cb849ec3b412dc3fbeacc9744840e423d7bf3f7dc0e3')

package() {
  python -m installer --destdir="$pkgdir" "$srcdir"/tokenizers-$pkgver-*.whl
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
