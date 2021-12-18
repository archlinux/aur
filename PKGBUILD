# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beanprice'
pkgdesc='Price quotes fetcher for Beancount'
pkgver=1.2.0
pkgrel=2
arch=('any')
url="https://github.com/beancount/beanprice"
license=('GPL')
depends=('beancount>=2.3.4' 'python-dateutil' 'python-requests')
provides=('beanprice')
conflicts=('beanprice-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/beancount/beanprice/archive/v${pkgver}.tar.gz")
sha256sums=('42e8b8cca9ebf554a748c2871ce8e4a02ae94a9b27441dc41b14926de7f33731')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    # Rename bean-price executable to avoid conflicts with beancount package
    mv "${pkgdir}/usr/bin/bean-price" "${pkgdir}/usr/bin/bean-price-standalone"
}
