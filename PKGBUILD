# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=dtags
pkgname="${_name}"
pkgver=3.1.2
pkgrel=1
pkgdesc='Directory Tags for Lazy Programmers'
url='https://github.com/joowani/dtags'
arch=('any')
license=('MIT')
depends=('python')
provides=("${_name}=${pkgver}")
install="${pkgname}.install"
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a9047ba1e0e31064967de8d480d3141ef8afaaf686e33774a513560ac747b05a')

# Enable for tests
# check() {
  # cd "${srcdir}/${_name}-${pkgver}"
  # python setup.py check
# }

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
