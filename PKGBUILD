# First Linux Arch packager: Serge Victor <arch@random.re>

_pipname=Flask-Bootstrap
pkgbase=python-flask-bootstrap
pkgname=('python2-flask-bootstrap' 'python-flask-bootstrap')
pkgver=3.3.5.6
pkgrel=1
pkgdesc="Packages Bootstrap into an extension that mostly consists of a blueprint named ‘bootstrap’."
arch=('any')
url="https://pythonhosted.org/Flask-Bootstrap/"
license=('Apache')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('8527aaefa724a30eef7578a3139bbdef')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-bootstrap() {
depends=('python2-flask' 'python2-visitor' 'python2-dominate')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-flask-bootstrap() {
depends=('python-flask' 'python-visitor' 'python-dominate')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1
}

