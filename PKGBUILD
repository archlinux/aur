# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Chuck_Norris'
pkgname='chucknorris'
pkgver=1.1
pkgrel=1
pkgdesc='Chuck Norris jokes in your terminal'
arch=('any')
url='https://github.com/kz6fittycent/Chuck_Norris'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0ece25fbee2b899e288c60ab8f7ea57327399ee7029bc9a30b09a821a52696e9')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
