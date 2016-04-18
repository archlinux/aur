# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=dtags
pkgname="${_name}"
pkgver=3.0.0
pkgrel=1
pkgdesc='Directory Tags for Lazy Programmers'
url='https://github.com/joowani/dtags'
arch=('any')
license=('MIT')
depends=('python')
provides=("${_name}=${pkgver}")
install="${pkgname}.install"
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('30d458003f9c8184c3f52783b68ac1911d267df3e66ed856af3ca61508276b10')

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
