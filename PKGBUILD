# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beanprice'
pkgdesc='Price quotes fetcher for Beancount'
pkgver=1.2.2
pkgrel=1
arch=('any')
url="https://github.com/beancount/beanprice"
license=('GPL')
depends=('beancount>=2.3.4' 'python-dateutil' 'python-requests')
provides=('beanprice')
conflicts=('beanprice-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/beancount/beanprice/archive/v${pkgver}.tar.gz")
sha256sums=('ba236e9981ef554779564c9860615de71e97012284cca25ad52c915f5a61093b')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    # Rename bean-price executable to avoid conflicts with beancount package
    mv "${pkgdir}/usr/bin/bean-price" "${pkgdir}/usr/bin/bean-price-standalone"
}
