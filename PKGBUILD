# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=Flask-Caching
pkgbase=python-flask-caching
pkgname=('python2-flask-caching' 'python-flask-caching')
pkgver=1.2.0
pkgrel=1
pkgdesc="Adds easy cache support to Flask."
arch=('any')
url="https://pythonhosted.org/Flask-Caching/"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools'
                            'python2-flask' 'python-flask')
source=("https://pypi.python.org/packages/17/2b/13c709c8889b425d9a10188df577217fd251b7cd11162e833ef839196cbc/$_pipname-$pkgver.tar.gz")
md5sums=('aab3b466c1b54780095d81fd7d457b52')

prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-caching() {
    depends=('python2-flask')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
    install -Dm 644 CHANGES  -t "${pkgdir}/usr/share/doc/${pkgname}"
}

package_python-flask-caching() {
    depends=('python-flask')

    cd $_pipname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
    install -Dm 644 CHANGES  -t "${pkgdir}/usr/share/doc/${pkgname}"
}
