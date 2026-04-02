pkgname=python-accuralai-discord
_pkgname=accuralai-discord
pkgver=0.2.1
pkgrel=1
pkgdesc="AI-powered Discord bot package integrating AccuralAI orchestration"
arch=('any')
url="https://github.com/AccuralAI/accuralai-discord"
license=('Apache-2.0')
depends=('python' 'python-aiohttp' 'python-discord')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
