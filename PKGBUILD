# Maintainer: acxz <akashpatel2008@yahoo.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>

pkgname=python-colcon-core
pkgver=0.8.3
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
sha256sums=('3e31523298704a5c49b19e85d6b42153a29f52044cbffbbb9fa824bf0d3384b9')

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
