# Submitter: Serge Victor <arch@random.re>
# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=Flask-SQLAlchemy
pkgbase=python-flask-sqlalchemy
pkgname=('python2-flask-sqlalchemy' 'python-flask-sqlalchemy')
pkgver=2.1
pkgrel=1
pkgdesc="Adds SQLAlchemy support to your Flask application"
arch=('any')
url="http://flask-sqlalchemy.pocoo.org/"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools'
             'python2-flask' 'python-flask'
             'python2-sqlalchemy' 'python-sqlalchemy')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('dc15fe08b07b434d3d2c4063b4674b72')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-sqlalchemy() {
depends=('python2-flask' 'python2-sqlalchemy')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

package_python-flask-sqlalchemy() {
depends=('python-flask' 'python-sqlalchemy')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
