
_pipname=flask-appconfig
pkgbase=python-flask-appconfig
pkgname=('python2-flask-appconfig' 'python-flask-appconfig')
pkgver=0.10.1
pkgrel=1
pkgdesc="Configures Flask applications in a canonical way. Also auto-configures Heroku. Aims to standardize configuration."
arch=('any')
url="http://github.com/mbr/flask-appconfig"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('136fc9ce5c3f55dee78c82e529864f2d')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-appconfig() {
depends=('python2-flask')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    chmod -R a+r $pkgdir/usr/lib/python*/site-packages/*info/

    # licence file is not available in the package, pypi says it is MIT
#    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
#    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

package_python-flask-appconfig() {
depends=('python-flask')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

    chmod -R a+r $pkgdir/usr/lib/python*/site-packages/*info/

    # licence file is not available in the package, pypi says it is MIT
#    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
#    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

