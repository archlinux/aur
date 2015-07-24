
_pipname=flask-nav
pkgbase=python-flask-nav
pkgname=('python2-flask-nav' 'python-flask-nav')
pkgver=0.4
pkgrel=1
pkgdesc="Easily create navigation for Flask applications."
arch=('any')
url="http://github.com/mbr/flask-nav"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('273db840f2678a50afd630b527d65747')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-nav() {
depends=('python2-flask')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    chmod -R a+r $pkgdir/usr/lib/python*/site-packages/*info/

    # licence file is not available in the package, pypi says it is MIT
#    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
#    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

package_python-flask-nav() {
depends=('python-flask')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

    chmod -R a+r $pkgdir/usr/lib/python*/site-packages/*info/

    # licence file is not available in the package, pypi says it is MIT
#    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
#    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

