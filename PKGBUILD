
_pipname=dominate
pkgbase=python-dominate
pkgname=('python2-dominate' 'python-dominate')
pkgver=2.1.12
pkgrel=1
pkgdesc="Python library for creating and manipulating HTML documents using an elegant DOM API."
arch=('any')
url="https://github.com/Knio/dominate"
license=('LGPL3')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('af77ace88dc32cedb3989412528ae635')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-dominate() {
depends=('python2')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

#    chmod -R a+r $pkgdir/usr/lib/python*/site-packages/*info/
}

package_python-dominate() {
depends=('python')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

#    chmod -R a+r $pkgdir/usr/lib/python*/site-packages/*info/

}

