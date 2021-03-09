# Maintainer: Victor Roest <victor@xirion.net>
pkgname=python-matrx
_name=${pkgname#python-}
pkgver=2.0.8
pkgrel=1
pkgdesc='A Python package for the rapid development and evaluation of human-agent teaming concepts.'
arch=('x86_64')
url='https://www.matrx-software.com/'
license=('MIT')
depends=('python-flask' 'python-jsonpickle' 'python-flask-socketio' 'python-numpy' 'python-requests' 'python-colour' 'python-gevent' 'python-flask-cors' 'python-docutils' 'python-pygments')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('36a07cdcbf96e9d893224266fa16b5b53025e4627a84647d0f3f9681061c77947b8e182bce457a13aceb5b54a7354a874643d9ef6798223a2ae71125ce78f81e')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

