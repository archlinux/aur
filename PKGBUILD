# Maintainer: acxz <akashpatel2008@yahoo.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>

pkgname=python-colcon-core
pkgver=0.5.9
pkgrel=1
pkgdesc="Command line tool to build sets of software packages."
arch=(any)
url="https://colcon.readthedocs.io/en/released/"
license=('Apache')
depends=('python-pytest' 'python-pytest-runner' 'python-pytest-rerunfailures'
         'python-pytest-repeat' 'python-coverage' 'python-pytest-cov'
         'python-distlib' 'python-notify2' 'python-empy')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/colcon/colcon-core/archive/$pkgver.tar.gz")
sha256sums=('e657aab632efdb17ba4b5a173d6c8f58ef47120453122081f057a9c878511c9b')

_pkgname=colcon-core

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
}
