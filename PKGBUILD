
_pipname=visitor
pkgbase=python-visitor
pkgname=('python2-visitor' 'python-visitor')
pkgver=0.1.3
pkgrel=1
pkgdesc="A tiny pythonic visitor implementation."
arch=('any')
url="https://github.com/mbr/visitor"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/d7/58/785fcd6de4210049da5fafe62301b197f044f3835393594be368547142b0/$_pipname-$pkgver.tar.gz")
md5sums=('94a024ed0ec1b02b4497c15267d319ca')

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

