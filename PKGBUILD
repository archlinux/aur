# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=textblob
pkgname=python-${_pkgname}
pkgver=0.19.0
pkgrel=1
pkgdesc='Simple, Pythonic, text processing--Sentiment analysis, part-of-speech tagging, noun phrase extraction, translation, and more.'
arch=('any')
url='https://github.com/sloria/textblob'
license=('MIT')
depends=('python-nltk' 'nltk-data')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-flit' 'python-flit-core')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('0fb422e903d8b640dc0d955ac79421b0a536d9c79ece11dbe238b9a60d8f48c3')

build() {
    cd "TextBlob-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "TextBlob-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
