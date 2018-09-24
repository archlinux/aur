# Maintainer: nosada <ngsksdt@gmail.com>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>

pkgname=python2-ipwhois
_pkgname=ipwhois
pkgver=1.0.0
pkgrel=1
pkgdesc="Retrieve and parse whois data for IPv4 and IPv6 addresses"
url="https://github.com/secynic/ipwhois"
arch=(any)
license=('MIT')
depends=('python2' 'python2-dnspython')
source=("https://github.com/secynic/${_pkgname}/archive/v${pkgver}.zip")
sha512sums=('678ca8b3e9cbc41b364536f6b0e84053a0385a9238c22afcb6e860e4097e4c25b72b360997b74392aa6c8e8bb849c01c9f069b9078f8b341361f662cf9250ed2')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python2 setup.py install --root=${pkgdir}
  install -Dm644 LICENSE.txt \
            ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

