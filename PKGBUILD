# First Linux Arch packager: Serge Victor <arch@random.re>

_pipname=Flask-Debug
pkgbase=python-flask-debug
pkgname=('python2-flask-debug' 'python-flask-debug')
pkgver=0.4.3
pkgrel=1
pkgdesc="Shows reflection/configuration to aid the development of Flask applications"
arch=('any')
url="http://github.com/mbr/flask-debug"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('884cfc8365ae9850405d9aadc3038a96')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-debug() {
depends=('python2-flask')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

package_python-flask-debug() {
depends=('python-flask')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

