pkgname=python-ipaddress
pkgver=1.0.18
pkgrel=1
pkgdesc="IPv4/IPv6 manipulation library"
arch=(any)
url="https://github.com/phihag/ipaddress"
license=('custom:PSF')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/i/ipaddress/ipaddress-$pkgver.tar.gz"
        LICENSE)
sha512sums=('7d1c8cf67db5b55a872783390ca214bb39e243d313311674afe10008e86638838bef5f9e6d703803bdcfde6d27520b1fc19d0adb19d482e27a327fb735aa0312'
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
