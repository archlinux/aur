# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-ipwhois
_pkgname=ipwhois
pkgver=0.15.1
pkgrel=1
pkgdesc="IP Whois Resolution and Parsing"
url="https://github.com/secynic/ipwhois"
arch=(any)
license=('MIT')
depends=('python' 'python-dnspython')
source=("https://github.com/secynic/${_pkgname}/archive/v${pkgver}.zip")
sha512sums=('5f0f44c53db438647e36c4bc112a134f7cbe017bfb45b04a0b2d866c53399e5e13e5d47208a0f881f6d5ade13095765b3882dee2d70b535b64006ff8762c5383')

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
