# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=inltk
pkgname=python-inltk
pkgver=0.9
pkgrel=4
pkgdesc="Natural Language Toolkit for Indic Languages aims to provide out of the box support for various NLP tasks for Indic languages."
arch=(x86_64)
url=https://github.com/goru001/inltk
license=(MIT)
depends=('python' 'python-pytorch' 'python-fastai' 'python-sentencepiece' 'python-aiohttp' 'python-scikit-learn')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('8f58a354fc68179465c86b3fb2dbbe1d0a6e35213eb789321a22ed39ffbf9a8d')

build() {
  cd "${_pkgname}-$pkgver"
  python -m build --wheel --no-isolation
}


package() {
  cd "${_pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:ts=2:sw=2:et:
