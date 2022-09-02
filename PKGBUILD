# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=python-prometheus-fastapi-instrumentator
pkgver=5.9.1
pkgrel=1
pkgdesc="A configurable and modular Prometheus Instrumentator for your FastAPI."
arch=('any')
url="https://github.com/trallnag/prometheus-fastapi-instrumentator"
license=('Apache2')
depends=('python' 'python-fastapi' 'python-prometheus_client')
makedepends=(python-build python-installer python-wheel  python-poetry-core)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('16fe7771ac5cf8486ce205430d2860f055428ebf907c63fc48ff337bd104d82f')

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
