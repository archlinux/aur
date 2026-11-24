# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hermes-hud
pkgver=0.5.0
pkgrel=1
pkgdesc="TUI monitor for the Hermes AI agent"
arch=('any')
url="https://github.com/joeynyc/hermes-hud"
license=('MIT')
depends=('python' 'python-textual' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joeynyc/hermes-hud/archive/v${pkgver}.tar.gz")
sha256sums=('742e8f47f9e53c938a22cdc9b544c9d6b1cd19395346cc7f128c89b2f151045c')

build() {
  cd "hermes-hud-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "hermes-hud-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
