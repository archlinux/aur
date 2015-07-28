
_pipname=simplekv
pkgbase=python-simplekv
pkgname=('python2-simplekv' 'python-simplekv')
pkgver=0.9.3
pkgrel=1
pkgdesc="A key-value storage for binary data, support many backends"
arch=('any')
url="http://github.com/mbr/simplekv"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('33ee89d21f71d2c7a049e1327fe39390')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-simplekv() {
depends=('python2')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    install -d ${pkgdir}/usr/share/licenses/$pkgname
    install -m 644 "$srcdir/${_pipname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

package_python-simplekv() {
depends=('python')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

    install -d ${pkgdir}/usr/share/licenses/$pkgname
    install -m 644 "$srcdir/${_pipname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

