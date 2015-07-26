
_pipname=visitor
pkgbase=python-visitor
pkgname=('python2-visitor' 'python-visitor')
pkgver=0.1.2
pkgrel=1
pkgdesc="A tiny pythonic visitor implementation."
arch=('any')
url="https://github.com/mbr/visitor"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('e9471b44e5d426b0adf5d27694598be0')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-visitor() {
depends=('python2')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

package_python-visitor() {
depends=('python')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

    chmod -R a+r $pkgdir/usr/lib/python*/site-packages/*info/

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

