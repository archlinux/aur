# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=xortool
pkgver=0.99
pkgrel=1
pkgdesc="Tool for xor cipher analysis"
arch=('any')
url="https://github.com/hellman/${pkgname}"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
depends=('python' 'python-docopt' 'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
sha256sums=('b92da4832b62745c639c439216ca4b73b902854ee50cae2e185eff3b21bb65de')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}