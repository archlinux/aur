# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-ipwhois
_pkgname=ipwhois
pkgver=0.10.2
pkgrel=1
pkgdesc="IP Whois Resolution and Parsing"
url="https://github.com/secynic/ipwhois"
arch=(any)
license=('MIT')
depends=('python' 'python-dnspython')
source=("https://pypi.python.org/packages/source/i/ipwhois/${_pkgname}-${pkgver}.zip")
sha1sums=('e006f70abeef78b36131c2c9e340106fcc99a5c7')

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
