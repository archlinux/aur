# Maintainer: Victor Roest <victor@xirion.net>
_name=matrx
pkgname=python-matrx-git
pkgver=v2.0.5.r0.g957ca9e
pkgrel=1
pkgdesc='A Python package for the rapid development and evaluation of human-agent teaming concepts.'
arch=('x86_64')
url='https://www.matrx-software.com/'
license=('MIT')
depends=('python-flask' 'python-jsonpickle' 'python-flask-socketio' 'python-numpy' 'python-requests' 'python-colour' 'python-gevent' 'python-flask-cors' 'python-docutils' 'python-pygments')
source=("git+https://github.com/matrx-software/${_name}.git")
sha512sums=('SKIP')

build() {
    cd "$_name"
    python setup.py build
}

package() {
    cd "$_name"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

pkgver() {
  cd "$_name"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
