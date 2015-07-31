
_pipname=Flask-Wdb
pkgbase=python-flask-wdb
pkgname=('python2-flask-wdb' 'python-flask-wdb')
pkgver=0.0.2
pkgrel=1
pkgdesc="Integrate Wdb instead of Werkzeug debugger for Flask applications"
arch=('any')
url="https://github.com/techniq/flask-wdb"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('950c16fa1e3e0d16fb3bbb923fb70037')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-wdb() {
depends=('python2' 'python2-wdb')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

#    install -d ${pkgdir}/usr/share/licenses/$pkgname
#    install -m 644 "$srcdir/${_pipname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

package_python-flask-wdb() {
depends=('python' 'python-wdb')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

#    install -d ${pkgdir}/usr/share/licenses/$pkgname
#    install -m 644 "$srcdir/${_pipname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

