# Maintainer: Pochang Chen <johnchen902@gmail.com>

pkgname=python-nclib
_name=nclib
pkgver=0.8.3
pkgrel=1
pkgdesc="Netcat as a library: convienent socket interfaces"
license=("MIT")
arch=('any')
url="https://pypi.python.org/pypi/nclib/0.8.1"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('82224f555df740178f128b7261de2137')
sha256sums=('7ee56ca74ade02796c01923b117d7192b7a2381ab06464b4168b0f4e0e0deb1d')

build() {
    cd "$srcdir"/nclib-$pkgver
    python setup.py build
}

check() {
    cd "$srcdir"/nclib-$pkgver
    python setup.py test
}

package() {
    depends=('python')
    cd nclib-$pkgver
    python setup.py install -O1 --root="$pkgdir"
}
