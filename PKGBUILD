# Maintainer:  Liu Zhe <cruise.pas@gmail.com>

pkgname=python-hyperopt
pkgver=0.1.1
pkgrel=1
pkgdesc='Distributed Asynchronous Hyperparameter Optimization in Python'
arch=('any')
url='https://github.com/hyperopt/hyperopt'
license=('custom')
depends=('python-scipy' 'python-pymongo' 'python-six' 'python-networkx' 'python-future')
makedepends=('python-setuptools')
source=("hyperopt-$pkgver.tar.gz::https://github.com/hyperopt/hyperopt/archive/$pkgver.tar.gz")
sha1sums=('98b36f8c42586574524f693b1f8982b1b05b5225')

build() {
    cd "$srcdir"/hyperopt-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/hyperopt-$pkgver
    python setup.py install --skip-build -O1 --root="$pkgdir"
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
