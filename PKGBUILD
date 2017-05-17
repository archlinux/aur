# Maintainer: ael-code

pkgbase='python-pydirl'
pkgname=('python-pydirl' 'python2-pydirl')
pkgver=0.3.2
pkgrel=1
pkgdesc="simple static webserver and directory listing"
arch=('any')
url="https://github.com/ael-code/pydirl"
license=('GPL3')
options=(!emptydirs)
makedepends=('python-setuptools' 'python2-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('28be1c6d7adf8285c5446fad0ff640e4')
sha1sums=('a555eacb64893daeaa9936e7b80f55a5e23d8015')
sha256sums=('2f6733bcbcc7e1bc33c03e1a5453fb61260a3288449b14664f6c4a288214e5df')

prepare(){
    cp -a "$srcdir/pydirl-${pkgver}"{,-python2}
}


package_python-pydirl() {
    depends=('python'
             'python-gevent'
             'python-flask'
             'python-click'
             'python-zipstream'
             'python-flask-bootstrap')

    cd "$srcdir/pydirl-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
  }

package_python2-pydirl() {
    depends=('python2'
             'python2-gevent'
             'python2-flask'
             'python2-click'
             'python2-zipstream'
             'python2-flask-bootstrap')

    cd "$srcdir/pydirl-${pkgver}-python2"
    python2 setup.py install --root="$pkgdir/" --optimize=1
  }

# vim:set ts=2 sw=2 et:
