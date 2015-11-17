# Maintainer: Javier Tia <javier dot tia at gmail dot com>
_name=sen
pkgname="python-${_name}"
pkgver=0.1.1
pkgrel=2
pkgdesc='sen is a terminal user interface for docker engine'
url='https://github.com/TomasTomecek/sen'
arch=('any')
license=('MIT')
depends=('python' 'python-urwid' 'python-humanize' 'python-docker-py')
provides=("${_name}=${pkgver}")
source=("https://pypi.python.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('199318c40d68bf7a6cfa5416c4ac7aa0563af489cf3b1f9fc679dc5720cd6478')

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
