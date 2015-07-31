
_pipname=wdb
pkgbase=python-wdb
depends=('python' 'python-log_colorizer' 'python-jedi')
pkgname=('python2-wdb' 'python-wdb')
pkgver=2.1.3
pkgrel=1
pkgdesc="An improbable web debugger through WebSockets (client only)"
arch=('any')
url="http://github.com/Kozea/wdb"
license=('LGPL3')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('440d0d88210c06d52da11f89959a70ec')

prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-wdb() {
depends=('python2' 'python2-log_colorizer' 'python2-jedi')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-wdb() {
depends=('python' 'python-log_colorizer' 'python-jedi')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1
}

