
_pipname=Flask-KVSession
pkgbase=python-flask-kvsession
pkgname=('python2-flask-kvsession' 'python-flask-kvsession')
pkgver=0.6.2
pkgrel=1
pkgdesc="Transparent server-side session support for flask"
arch=('any')
url="https://github.com/mbr/flask-kvsession"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('5428bd11f623febab4ccbc5d3dafd59c')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-kvsession() {
depends=('python2')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    install -d ${pkgdir}/usr/share/licenses/$pkgname
    install -m 644 "$srcdir/${_pipname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

package_python-flask-kvsession() {
depends=('python')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

    install -d ${pkgdir}/usr/share/licenses/$pkgname
    install -m 644 "$srcdir/${_pipname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

