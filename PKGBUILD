# Maintainer: Victor Roest <victor@xirion.net>
pkgname=python-matrx
_name=${pkgname#python-}
pkgver=2.3.0
pkgrel=1
pkgdesc='A Python package for the rapid development and evaluation of human-agent teaming concepts.'
arch=('x86_64')
url='https://www.matrx-software.com/'
license=('MIT')
depends=('python-flask' 'python-jsonpickle' 'python-flask-socketio' 'python-numpy' 'python-requests' 'python-colour' 'python-gevent' 'python-flask-cors' 'python-docutils' 'python-pygments')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('b036346d1845480d766d0ebba114d98d7de66e10b868d3a9c18732ed1e69a487f5b9c4864bf85617bcd1dbae22c3cefd5089ac7c577f1640cc60b3e0742c20bf')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

