# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=textblob
pkgname=python-${_pkgname}
pkgver=0.18.0
pkgrel=1
pkgdesc='Simple, Pythonic, text processing--Sentiment analysis, part-of-speech tagging, noun phrase extraction, translation, and more.'
arch=('any')
url='https://github.com/sloria/textblob'
license=('MIT')
depends=('python-nltk' 'nltk-data')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-flit' 'python-flit-core')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('2261b8cdacb04217dcd1704827f44913835241179932a7e6d926ce70ea9f99cc')

build() {
    cd "TextBlob-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "TextBlob-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
