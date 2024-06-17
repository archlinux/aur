# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname='oelint-adv'
pkgver=5.5.2
pkgrel=1
pkgdesc='Linter for bitbake recipes based in OE Styleguide'
url='https://github.com/priv-kweihmann/oelint-adv'
arch=('any')
license=('BSD 2-Clause')
depends=('python-urllib3' 'python-anytree' 'python-colorama' 'python-oelint-parser')
makedepends=('python-setuptools')
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d26ff6af54a9754e6c8e1ba9477f47d9a659a234f9a8dcd538f9a9d146703bce')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
