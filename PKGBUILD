# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-ipwhois
_pkgname=ipwhois
pkgver=1.2.0
pkgrel=1
pkgdesc="Retrieve and parse whois data for IPv4 and IPv6 addresses"
url="https://github.com/secynic/ipwhois"
arch=(any)
license=('MIT')
depends=('python' 'python-dnspython')
makedepends=('python-setuptools')
source=("https://github.com/secynic/${_pkgname}/archive/v${pkgver}.zip")
sha512sums=('88f021686606300461bc80ea0413c0f6a2fcd09597c8de072a7dba1703b6514b4b3792132e55198bde1b02bf99a390f7feb23ed5dfb99250a1bdacd5ab6cf860')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py install --root=${pkgdir}
  install -Dm644 LICENSE.txt \
            ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
