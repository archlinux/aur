# Maintainer: Evgeniy Alekseev

pkgname=python-aioauth-client
_pkgname=aioauth-client
pkgver=0.30.1
pkgrel=1
pkgdesc="OAuth support for Asyncio/Trio libraries"
arch=('any')
url="https://github.com/klen/aioauth-client"
license=('MIT')
depends=('python-httpx')
makedepends=('python-poetry')
source=("https://github.com/klen/aioauth-client/archive/refs/tags/${pkgver}.tar.gz")

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('ddf324c27e38d8ede4bb925da2453047378c50c7765ea133992c018144b72abe415c5efb4d8744089291a814896a68cf0b7b013dc679fd457e3995288557b711')
