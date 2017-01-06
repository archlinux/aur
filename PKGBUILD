# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=sen
pkgname="python-${_name}"
pkgver=0.5.0
pkgrel=1
pkgdesc='sen is a terminal user interface for docker engine'
url='https://github.com/TomasTomecek/sen'
arch=('any')
license=('MIT')
depends=('python' 'python-urwid' 'python-humanize' 'python-docker-py' 'python-urwidtrees')
provides=("${_name}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
# source=("https://pypi.python.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('035447a8eda1af5159f1ce946db16da4f7a3e1485ca1983380ff5bfb95d676a5')

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
