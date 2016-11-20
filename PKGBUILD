pkgname=python-ipaddress
pkgver=1.0.17
pkgrel=1
pkgdesc="IPv4/IPv6 manipulation library"
arch=(any)
url="https://github.com/phihag/ipaddress"
license=('custom:PSF')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/i/ipaddress/ipaddress-$pkgver.tar.gz"
        LICENSE)
sha512sums=('c9f7c7226fd28a1b3905139713c2269b4bdbe5bc1b8e44ab8edd56c0cd2b6938577a66fce139ecce06398de89321097ac672bff2d1618ca2f3b917c15553f50d'
            '5cc59a125412b0eb35f05d40756db050805fc1bd5729f350796644ad92b8117f8d3ed3c7cf6ab8b072518706bf95a1d40f016d065726a1296e19ea09582ec385')

check() {
  # Not included in release tarball
  cd ipaddress-$pkgver
  # python test_ipaddress.py
}

package() {
  cd ipaddress-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
