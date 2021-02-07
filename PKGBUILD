# Maintainer: Victor Roest <victor@xirion.net>
pkgname=python-matrx
_name=${pkgname#python-}
pkgver=2.0.4
pkgrel=1
pkgdesc='A Python package for the rapid development and evaluation of human-agent teaming concepts.'
arch=('x86_64')
url='https://www.matrx-software.com/'
license=('MIT')
depends=('python-flask' 'python-jsonpickle' 'python-flask-socketio' 'python-numpy' 'python-requests' 'python-colour' 'python-gevent' 'python-flask-cors' 'python-docutils' 'python-pygments')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('08f7f2ba16f97893d9252ed5b111b0a1fe413ddba207b29e84b743a9943c5a6ea51124d0bbfdc78dd050ff3e32bb70b33bcddf1dba997ef61b12089c2a5e8ee4')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

