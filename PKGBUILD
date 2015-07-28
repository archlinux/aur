# First Linux Arch packager: Serge Victor <arch@random.re>

_pipname=Flask-WTF
pkgbase=python-flask-wtf
pkgname=('python2-flask-wtf' 'python-flask-wtf')
pkgver=0.12
pkgrel=1
pkgdesc="Simple integration of Flask and WTForms"
arch=('any')
url="https://pythonhosted.org/Flask-WTF/"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('c53a74e8ba481bf53405fd5efdf0339e')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-wtf() {
depends=('python2-flask' 'python2-wtforms')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

package_python-flask-wtf() {
depends=('python-flask' 'python-wtforms')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

