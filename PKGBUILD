# Maintainer:  Vladimir Kokes <vladimir.kokes at favourix dot com>
# Contributor: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-applicationinsights
pkgver=1.0.0b15
pkgrel=1
pkgdesc="Application Insights SDK for Python"
arch=('any')
url="https://github.com/Microsoft/ApplicationInsights-Python"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/microsoft/ApplicationInsights-Python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eabe3c863cfff7e6af461c8cfbfb33ccda81d054595f65a628ddc5c7aa43c399')

build() {
  cd "ApplicationInsights-Python-${pkgver}/azure-monitor-opentelemetry"
  python setup.py build
}

package() {
  cd "ApplicationInsights-Python-${pkgver}/azure-monitor-opentelemetry"
  python setup.py install --root="${pkgdir}" --optimize=1
}

