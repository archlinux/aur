# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: nosada <ngsksdt@gmail.com>

pkgname=python-ipwhois
_pkgname=ipwhois
pkgver=1.3.0
pkgrel=1
pkgdesc="Retrieve and parse whois data for IPv4 and IPv6 addresses"
url="https://github.com/secynic/ipwhois"
arch=(any)
license=('MIT')
depends=('python' 'python-dnspython' 'python-defusedxml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://github.com/secynic/${_pkgname}/archive/v${pkgver}.zip")
sha512sums=('0455e24bccdfc0af4cd465517bb355c8bd1897eaa532a0a99f23253959100bfe1a5182c9d353f9b1fc96dfd8e0077c2d5b1bb0fd777cfc80ce00ddef4346b57f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
