# Maintainer: Kevin Azzam <aur@azz.am>

_extracted_name=flask-caching
pkgbase=python-flask-caching
pkgname=('python2-flask-caching' 'python-flask-caching')
pkgver=1.3.3
pkgrel=1
pkgdesc="Adds easy cache support to Flask."
arch=('any')
url="https://pythonhosted.org/Flask-Caching/"
license=('BSD')
source=("https://github.com/sh4nks/flask-caching/archive/v${pkgver}.tar.gz")
sha512sums=('4729a1138a26182e420dbe0f25719ad37f0af87e589cf568cf1deb5b2a5b65da0f11213a4d91a92cc671632d07d0fc0a37f7ae4d3a2e8c3f905e9d65f5d118c7')

prepare() {
    cp -R $_extracted_name-$pkgver python2-$_extracted_name-$pkgver
}

package_python2-flask-caching() {
    makedepends=('python2-setuptools' 'python2-flask')
    depends=('python2-flask')

    cd python2-$_extracted_name-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
    install -Dm 644 CHANGES  -t "${pkgdir}/usr/share/doc/${pkgname}"
}

package_python-flask-caching() {
    makedepends=('python-setuptools' 'python-flask')
    depends=('python-flask')

    cd $_extracted_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
    install -Dm 644 CHANGES  -t "${pkgdir}/usr/share/doc/${pkgname}"
}
