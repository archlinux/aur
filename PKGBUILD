# Maintainer: Javier Tia <javier dot tia at gmail dot com>
_name=sen
pkgname="python-${_name}"
pkgver=0.2.2
pkgrel=1
pkgdesc='sen is a terminal user interface for docker engine'
url='https://github.com/TomasTomecek/sen'
arch=('any')
license=('MIT')
depends=('python' 'python-urwid' 'python-humanize' 'python-docker-py')
provides=("${_name}=${pkgver}")
source=("https://pypi.python.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d85efee3c8fa24536426fbd2956913be31e60e2dc30f0ad6f73ca56a19456e35')

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
