# Maintainer: Benoit Brummer (trougnouf) <trougnouf@gmail.com>

pkgname=python-scikit-multilearn
_realname=scikit-multilearn
pkgver=0.2.0
pkgrel=1
pkgdesc="A Python module for multi-label learning built on top of scikit-learn"
arch=('any')
url="https://scikit.ml/"
license=('BSD-2-Clause')
depends=(
    'python'
    'python-numpy'
    'python-scipy'
    'python-scikit-learn'
    'python-liac-arff'
    'python-requests'
    'python-networkx'
)
makedepends=(
    'python-setuptools'
)
optdepends=(
    'python-igraph: for igraph library based clusterers (GPL licensed)'
    'python-keras: for Keras based classifiers'
    'python-javabridge: for MEKA bridge support' # >=1.0.14
    'python-weka-wrapper3: for MEKA bridge support' # >=0.2.0
    # 'python-openne: for OpenNE based methods (requires manual installation or separate AUR package for OpenNE)'
    # 'python-graph-tool: for graphtool based clusters (complex manual installation required, see project website)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_realname/$_realname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6ac89d25206c72a175369caaaceebb47ec992e588fb3552139832123ae4801de')

build() {
    cd "$_realname-$pkgver"
    python setup.py build
}

package() {
    cd "$_realname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
