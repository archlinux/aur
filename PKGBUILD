# Maintainer: nosada <ngsksdt@gmail.com>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>

pkgname=python2-ipwhois
_pkgname=ipwhois
pkgver=1.1.0
pkgrel=1
pkgdesc="Retrieve and parse whois data for IPv4 and IPv6 addresses"
url="https://github.com/secynic/ipwhois"
arch=(any)
license=('MIT')
depends=('python2' 'python2-dnspython')
makedepends=('python2-setuptools')
source=("https://github.com/secynic/${_pkgname}/archive/v${pkgver}.zip")
sha512sums=('aa5186ec59403ad016260e3bc09bdf2e488553cd68301b0e1c3ef8d72bdbbb8428ed0ac10754315ffc95aea7e4102580acc73da77f8d2ae508ad13e2cd7c54e1')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python2 setup.py install --root=${pkgdir}
  install -Dm644 LICENSE.txt \
            ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
