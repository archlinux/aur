# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=indic_nlp_library
pkgname=python-indic-nlp-library
pkgver=0.92
_pkgver=INDIC_NLP_${pkgver}
pkgrel=2
pkgdesc="Resources and tools for Indian language Natural Language Processing."
arch=('any')
url=https://github.com/anoopkunchukuttan/indic_nlp_library
license=('MIT')
depends=('python' 'python-sphinx-argparse' 'python-sphinx_rtd_theme' 'python-morfessor' 'python-pandas' 'python-numpy')
optdepends=('python-urduhack')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${_pkgver}.tar.gz)
sha256sums=('b7881b028adad9ce3b5053d1a3e5bf51768d91d322ddb94f35dc6b8853407774')

build() {
  cd "${_pkgname}-$_pkgver"
  python -m build --wheel --no-isolation
}


package() {
  cd "${_pkgname}-$_pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:ts=2:sw=2:et:
