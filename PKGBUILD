# Current Packager: Christoph Stahl <christoph.stahl@uni-dortmund.de>

_pipname=pySmartDL
pkgbase=python-pysmartdl
pkgname=('python2-pysmartdl' 'python-pysmartdl')
pkgver=1.2.4
pkgrel=1
pkgdesc="A Smart Download Manager for Python"
arch=('any')
url="https://github.com/iTaybb/pySmartDL/"
license=('Public Domain')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('4935dab07663b2f78ead0544af11bf2b')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-pysmartdl() {
depends=('python2-futures')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-pysmartdl() {

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1
}

