
_pipname=Flask-Bcrypt
pkgbase=python-flask-bcrypt
pkgname=('python2-flask-bcrypt' 'python-flask-bcrypt')
pkgver=0.7.1
pkgrel=1
pkgdesc="Bcrypt hashing for Flask"
arch=('any')
url="https://pythonhosted.org/Flask-Bcrypt/"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/maxcountryman/flask-bcrypt/archive/${pkgver}.tar.gz")
md5sums=('52747432432d6057fac3ed365c13a466')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-bcrypt() {
depends=('python2-flask' 'python2-bcrypt')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

package_python-flask-bcrypt() {
depends=('python-flask' 'python-bcrypt')

    cd $_pipname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
