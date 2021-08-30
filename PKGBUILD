# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Chuck_Norris'
pkgname='chucknorris'
pkgver=1.3
pkgrel=1
pkgdesc='Chuck Norris jokes in your terminal'
arch=('any')
url='https://github.com/kz6fittycent/Chuck_Norris'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a59b3b94986091266751757fb2a106272eff01f78dfaf034584b3335bf05e559')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
