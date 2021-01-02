# Maintainer:  Liu Zhe <cruise.pas@gmail.com>

pkgname=python-hyperopt
pkgver=0.2.5
pkgrel=2
pkgdesc='Distributed Asynchronous Hyperparameter Optimization in Python'
arch=('any')
url='https://github.com/hyperopt/hyperopt'
license=('custom')
depends=('python-scipy' 'python-six' 'python-networkx' 'python-future' 'python-tqdm' 'python-cloudpickle')
optdepends=('python-pymongo: MongoTrials' 'python-lightgbm: ATPE' 'python-scikit-learn: ATPE')
source=("hyperopt-$pkgver.tar.gz::https://github.com/hyperopt/hyperopt/archive/$pkgver.tar.gz")
sha1sums=('6ddf1e4761df9c5756b1dc646fba1a86b91b36d0')

build() {
    cd "$srcdir"/hyperopt-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/hyperopt-$pkgver
    python setup.py install --skip-build -O1 --root="$pkgdir"
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
