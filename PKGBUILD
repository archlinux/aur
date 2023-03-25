# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=python-prometheus-fastapi-instrumentator
pkgver=6.0.0
pkgrel=1
pkgdesc="A configurable and modular Prometheus Instrumentator for your FastAPI."
arch=('any')
url="https://github.com/trallnag/prometheus-fastapi-instrumentator"
license=('Apache2')
depends=('python' 'python-fastapi' 'python-prometheus_client')
makedepends=(python-build python-installer python-wheel  python-poetry-core)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c2cb47ccf7405f56a2354b96b5bf4be549a7f24abfe9f624918868f361e415f2')

build() {
  cd "prometheus-fastapi-instrumentator-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "prometheus-fastapi-instrumentator-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
