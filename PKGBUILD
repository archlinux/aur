
_pipname=wdb.server
pkgbase=python-wdb.server
pkgname=('python2-wdb.server' 'python-wdb.server')
pkgver=2.1.3
pkgrel=1
pkgdesc="An improbable web debugger through WebSockets (server)"
arch=('any')
url="http://github.com/Kozea/wdb"
license=('LGPL3')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('3958be164ab88cd58a2fa8afe94026d3')

prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-wdb.server() {
depends=('python2' 'python2-tornado' 'tornado_systemd' 'python2-psutil')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

}

package_python-wdb.server() {
depends=('python' 'python-tornado' 'tornado_systemd' 'python-psutil')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

}
