
_pipname=log_colorizer
pkgbase=python-log_colorizer
pkgname=('python2-log_colorizer' 'python-log_colorizer')
pkgver=1.6
pkgrel=1
pkgdesc="A color formater for python logging"
arch=('any')
url="https://github.com/Kozea/log_colorizer"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('f052908c63a1bfb0cda4287414f43bef')

prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-log_colorizer() {
depends=('python2')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
#    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
#    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

package_python-log_colorizer() {
depends=('python')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1
#    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
#    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
