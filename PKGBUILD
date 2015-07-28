# First Linux Arch packager: Serge Victor <arch@random.re>

_pipname=Flask-DebugToolbar
pkgbase=python-flask-debugtoolbar
pkgname=('python2-flask-debugtoolbar' 'python-flask-debugtoolbar')
pkgver=0.10.0
pkgrel=1
pkgdesc="A toolbar overlay for debugging Flask applications"
arch=('any')
url="http://flask-debugtoolbar.rtfd.org/"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('df4f79eaeec4045ab48727e619b7fa55')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-debugtoolbar() {
depends=('python2-flask' 'python2-visitor' 'python2-dominate')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-flask-debugtoolbar() {
depends=('python-flask' 'python-visitor' 'python-dominate')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1
}

