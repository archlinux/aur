# Maintainer:  Liu Zhe <cruise.pas@gmail.com>

pkgname=python-hyperopt
pkgver=0.1.2
pkgrel=1
pkgdesc='Distributed Asynchronous Hyperparameter Optimization in Python'
arch=('any')
url='https://github.com/hyperopt/hyperopt'
license=('custom')
depends=('python-scipy' 'python-pymongo' 'python-six' 'python-networkx' 'python-future' 'python-tqdm')
optdepends=('python-dill')
makedepends=('python-setuptools')
source=("hyperopt-$pkgver.tar.gz::https://github.com/hyperopt/hyperopt/archive/$pkgver.tar.gz")
sha1sums=('f58de8c6041369127026a4928411d99f612bf3b3')

build() {
    cd "$srcdir"/hyperopt-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/hyperopt-$pkgver
    python setup.py install --skip-build -O1 --root="$pkgdir"
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
