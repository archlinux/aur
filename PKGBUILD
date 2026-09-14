# Maintainer: Mikhaul f. Shiryaev <mr dot felixoid at gmail dot com>

_name=litprinter
pkgname=python-${_name}
pkgver=0.3.3
pkgrel=1
pkgdesc="IceCream + Rich = LitPrinter — The ultimate debug printing library for Python"
arch=(any)
url="https://github.com/OEvortex/llm4free"
license=('MIT')
depends=('python'
    'python-asttokens'
    'python-colorama'
    'python-executing'
    'python-pygments'
  )
makedepends=('python-setuptools' 'python-wheel')
source=(
  "${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/ea/78/817f92c5ed28c6d9b3e27821596dee2795bad2668091beac7d8a1e441771/litprinter-0.3.3.tar.gz"
  # Patch to fix trio dependency issue from https://github.com/OEvortex/Webscout/pull/82
)
sha256sums=(
  ccb3238ab5cc1f132b6f9c05382f326d66f4fe9567ca02ae5180750d3ed246c3
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

