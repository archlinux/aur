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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/darrenburns/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2349a8139481e94678debc57db4d09244a46303d3373ac8424ad9e3fc1c8fa03')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  uv build --wheel --out-dir dist
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
