# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname='oelint-adv'
pkgver=5.3.0
pkgrel=1
pkgdesc='Linter for bitbake recipes based in OE Styleguide'
url='https://github.com/priv-kweihmann/oelint-adv'
arch=('any')
license=('BSD 2-Clause')
depends=('python-urllib3' 'python-anytree' 'python-colorama' 'python-oelint-parser')
makedepends=('python-setuptools')
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('748a383137486506a7a9f34e05964accc1647f6ecbe2d5e50a3883efd5c08de9')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
