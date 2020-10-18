# Maintainer: acxz <akashpatel2008@yahoo.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>

pkgname=python-colcon-core
pkgver=0.6.1
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
sha256sums=('0c0de2563e122c837c8c914e50b10ffe068e7cfaa5f43226ada0a7ae2824899e')

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
