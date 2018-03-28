# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=sen
pkgname="python-${_name}"
pkgver=0.6.0
pkgrel=1
pkgdesc='sen is a terminal user interface for docker engine'
url='https://github.com/TomasTomecek/sen'
arch=('any')
license=('MIT')
depends=('python' 'python-urwid' 'python-humanize' 'python-docker-py' 'python-urwidtrees')
provides=("${_name}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
# source=("https://pypi.python.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8a94ecd3edcbd33182a7d583d095bd9c94f50d120edd20a237f4d6c175cc9250')

# Enable for tests
check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py check
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
