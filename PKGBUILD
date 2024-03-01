# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Cillian Berragan <cjberragan@gmail.com>
pkgname=python-stanza
_name=${pkgname#python-}
pkgver=1.8.1
pkgrel=1
pkgdesc="Stanford NLP Python library for tokenization, sentence segmentation, NER, and parsing of many human languages"
arch=('any')
url="https://stanfordnlp.github.io/stanza"
license=('Apache-2.0')
depends=(
  'python-emoji'
  'python-networkx'
  'python-numpy'
  'python-protobuf'
  'python-pytorch'
  'python-requests'
  'python-toml'
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::https://github.com/stanfordnlp/stanza/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a134ac823bc56b6502cb363a741ddebb272bbded5eb4b8d2a6b952091e1594a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
