# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=python-tokenizers-bin
_pkgname=tokenizers
pkgver=0.23.2
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
source_x86_64=("https://files.pythonhosted.org/packages/2c/ca/ca6b93c7820df123b2662a9469e8facc826ccc94e98fdd0d615f6431e73a/tokenizers-$pkgver-cp310-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/2e/4d/8f569ed49372a3ed8e57099bd515055fd48d7c95912c4307cda6973c2168/tokenizers-$pkgver-cp310-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl")
noextract=("tokenizers-$pkgver-cp310-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
           "tokenizers-$pkgver-cp310-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('41c2f84d172449b4dadb9cdc508e3e364076613c35b16e76ecfe47a60d1e3305')
sha256sums_aarch64=('a37039b5dfc4af84eb3ef0a92f4307e28936c8f9adccba2629d36f652e9bf7a2')

package() {
  python -m installer --destdir="$pkgdir" "$srcdir"/tokenizers-$pkgver-*.whl
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
