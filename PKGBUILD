# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname='oelint-adv'
pkgver=5.1.0
pkgrel=1
pkgdesc='Linter for bitbake recipes based in OE Styleguide'
url='https://github.com/priv-kweihmann/oelint-adv'
arch=('any')
license=('BSD 2-Clause')
depends=('python-urllib3' 'python-anytree' 'python-colorama' 'python-oelint-parser')
makedepends=('python-setuptools')
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d035c9dfd9d7901c51f0681c005614dcb66979363c17288706936408be3a333b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
