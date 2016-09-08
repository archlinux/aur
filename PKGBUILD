# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=("python-tlslite-ng" "python2-tlslite-ng")
pkgbase="python-tlslite-ng"
pkgver=0.6.0
pkgrel=1
pkgdesc="Pure python implementation of SSL and TLS"
url="https://github.com/tomato42/tlslite-ng"
arch=('any')
license=('custom:mixed free licenses')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomato42/tlslite-ng/archive/v${pkgver}.tar.gz")
md5sums=('b531511ea817712ee29e8270e22fd3a2')

package_python-tlslite-ng() {
    depends=("python-ecdsa")

    cd tlslite-ng-${pkgver%_*}-${pkgver#*_}
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-tlslite-ng() {
    depends=("python2-ecdsa")

    cd tlslite-ng-${pkgver%_*}-${pkgver#*_}
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
