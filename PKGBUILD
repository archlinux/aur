
_pipname=Flask-Bcrypt
pkgbase=python-flask-bcrypt
pkgname=('python2-flask-bcrypt' 'python-flask-bcrypt')
pkgver=0.6.2
pkgrel=1
pkgdesc="Brcrypt hashing for Flask."
arch=('any')
url="https://pythonhosted.org/Flask-Bcrypt/"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('5ec930a2004baca4867d742c3b16aa20')


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

