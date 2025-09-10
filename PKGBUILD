# Maintainer: Mikhaul f. Shiryaev <mr dot felixoid at gmail dot com>

_name=litproxy
pkgname=python-${_name}
pkgver=0.2.1
pkgrel=2
pkgdesc='Modern, Easy-to-Use Python Proxy Management Library'
arch=(any)
url="https://github.com/OEvortex/Webscout"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/38/1e/bf6b6c44439a4193b55cba808f5c5ee8f52180b9470f6c3f4f8caabc2117/litproxy-0.2.1.tar.gz")
sha256sums=(
  ea836079c75a209aebcd6c6d04423706b9ff884c54e67f49ab935b0a2dc1f171
)

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/${_name}-${pkgver}-py3-none-any.whl"
}

# vim:set ts=2 sw=2 et:
