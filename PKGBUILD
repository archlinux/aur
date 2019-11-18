# Maintainer: Nigel Kukard <nkukard@lbsd.net>
# Contributor: Serge Victor <arch@random.re>

_pipname=Flask-DebugToolbar
pkgbase=python-flask-debugtoolbar
pkgname=('python2-flask-debugtoolbar' 'python-flask-debugtoolbar')
pkgver=0.10.1
pkgrel=1
pkgdesc="A toolbar overlay for debugging Flask applications"
arch=('any')
url="http://flask-debugtoolbar.rtfd.org/"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('ec810083123aae0632eb32ba11e1cb4cdace81e7ce6c5009dd06c5204afbce52')


prepare() {
	cp -R "$_pipname-$pkgver" "python2-$_pipname-$pkgver"
}

package_python2-flask-debugtoolbar() {
	depends=('python2-blinker' 'python2-flask' 'python2-visitor' 'python2-dominate')

    cd "python2-$_pipname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-flask-debugtoolbar() {
	depends=('python-blinker' 'python-flask' 'python-visitor' 'python-dominate')

    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

