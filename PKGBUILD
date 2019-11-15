# Maintainer: Payson Wallach <payson@paysonwallach.com>

_name=persist-queue
pkgname=python-persist-queue
pkgver=0.5.0
pkgrel=2
pkgdesc="A thread-safe disk based persistent queue in Python."
arch=(any)
url="http://github.com/peter-wangxu/persist-queue"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('3644ef1a990c29ced4e62b5c4672126a')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
