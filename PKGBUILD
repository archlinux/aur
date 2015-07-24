
_pipname=Flask-SQLAlchemy
pkgbase=python-flask-sqlalchemy
# it should be:
#pkgname=('python2-flask-sqlalchemy' 'python-flask-sqlalchemy')
# temporary it is, until python2 only package is not removed:
pkgname=('python-flask-sqlalchemy')
pkgver=2.0
pkgrel=1
pkgdesc="Adds SQLAlchemy support to your Flask application"
arch=('any')
url="https://pythonhosted.org/Flask-SQLAlchemy/"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('06ae73194cca73b72e178f870d1dac7c')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

#package_python2-flask-sqlalchemy() {
#depends=('python2-flask')
#
#    cd python2-$_pipname-$pkgver
#    python2 setup.py install --root="$pkgdir/" --optimize=1
#
#    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
#    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
#}

package_python-flask-sqlalchemy() {
depends=('python-flask')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

