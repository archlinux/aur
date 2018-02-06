pkgname=python-ipaddress
pkgver=1.0.19
pkgrel=1
pkgdesc="IPv4/IPv6 manipulation library"
arch=(any)
url="https://github.com/phihag/ipaddress"
license=('custom:PSF')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/i/ipaddress/ipaddress-$pkgver.tar.gz"
        LICENSE)
sha512sums=('e49d0d0b76c108f985a5d209092495b5839195d9c4d5c975cc17c89e98d9b6bf0983f71f3b183c3974eccf0529cfb22aa8fbe384485be019da3fb74d50f1f4f1'
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
