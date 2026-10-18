# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Lennart Regebro
# Contributo: Fabien Devaux <fdev 31 at gmail dot com>

pkgname=hovercraft
pkgver=2.7
pkgrel=2
pkgdesc="A tool to make impress.js presentations from reStructuredText"
arch=(any)
url="https://github.com/regebro/hovercraft"
license=('CCPL')
depends=('python' 'python-lxml' 'python-docutils' 'python-svg.path' 'python-pygments' 'python-watchdog')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=(https://pypi.python.org/packages/source/h/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('0aa8341c9aba01c54e04457e8ffd577e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
