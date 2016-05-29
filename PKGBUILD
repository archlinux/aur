# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-ipwhois
_pkgname=ipwhois
pkgver=0.13.0
pkgrel=1
pkgdesc="IP Whois Resolution and Parsing"
url="https://github.com/secynic/ipwhois"
arch=(any)
license=('MIT')
depends=('python' 'python-dnspython')
source=("https://pypi.python.org/packages/source/i/ipwhois/${_pkgname}-${pkgver}.zip")
sha512sums=('09819bf8b5f4e748043bccbc7221133bf9a3fccf4306a92cef2cd21800377d5f0cf41e888af2d3fd34ef417bff50e6486006a90c334e29a5af5262a36e399195')

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
