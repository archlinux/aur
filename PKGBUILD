# Maintainer:  Vladimir Kokes <vladimir.kokes at favourix dot com>
# Contributor: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-applicationinsights
pkgver=1.0.0b14
pkgrel=1
pkgdesc="Application Insights SDK for Python"
arch=('any')
url="https://github.com/Microsoft/ApplicationInsights-Python"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/microsoft/ApplicationInsights-Python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ea91a23047e267990de0a763665c2b0e23ad765af425e94cc127a5bb962f83df')

build() {
  cd "ApplicationInsights-Python-${pkgver}/azure-monitor-opentelemetry"
  python setup.py build
}

package() {
  cd "ApplicationInsights-Python-${pkgver}/azure-monitor-opentelemetry"
  python setup.py install --root="${pkgdir}" --optimize=1
}

