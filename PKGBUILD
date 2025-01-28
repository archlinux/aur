# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beanprice'
pkgdesc='Price quotes fetcher for Beancount'
pkgver=1.2.1
pkgrel=1
arch=('any')
url="https://github.com/beancount/beanprice"
license=('GPL')
depends=('beancount>=2.3.4' 'python-dateutil' 'python-requests')
provides=('beanprice')
conflicts=('beanprice-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/beancount/beanprice/archive/v${pkgver}.tar.gz")
sha256sums=('54ab3469f5dbf219b14f3e8ace71ef2669f85777b967c96277d090045782795a')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    # Rename bean-price executable to avoid conflicts with beancount package
    mv "${pkgdir}/usr/bin/bean-price" "${pkgdir}/usr/bin/bean-price-standalone"
}
