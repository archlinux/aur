# Maintainer: Gobidev <adrian[dot]groh[at]t[dash]online[dot]de>

pkgname=dunk
pkgver=0.5.0b0
pkgrel=1
pkgdesc="Prettier git diffs in the terminal"
arch=('any')
url="https://github.com/darrenburns/dunk"
license=('MIT')
depends=('python' 'python-unidiff' 'python-rich')
makedepends=('uv' 'python-installer' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/darrenburns/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('50dc9902abb2eb943489df5cca72a4db41c456b65b5b83ead82f0be2e0d4f0ee')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  uv build --wheel --out-dir dist
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
