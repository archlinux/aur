# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beanprice'
pkgdesc='Price quotes fetcher for Beancount'
pkgver=1.1.0
pkgrel=1
arch=('any')
url="https://github.com/beancount/beanprice"
license=('GPL')
depends=('beancount')
source=("$pkgname-$pkgver.tar.gz::https://github.com/beancount/beanprice/archive/v${pkgver}.tar.gz")
sha256sums=('78349ec9a0895507dad9dd659cee6d40ef0f01b5e64661df49c037d727b5952e')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    mv "${pkgdir}/usr/bin/bean-price" "${pkgdir}/usr/bin/bean-price-standalone"
}
