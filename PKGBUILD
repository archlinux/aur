# Maintainer: Evgeniy Alekseev

pkgname=python-aioauth-client
_pkgname=aioauth-client
pkgver=0.26.0
pkgrel=1
pkgdesc="OAuth support for Asyncio/Trio libraries"
arch=('any')
url="https://github.com/klen/aioauth-client"
license=('MIT')
depends=('python-httpx')
makedepends=('python-setuptools')
source=("https://github.com/klen/aioauth-client/archive/refs/tags/${pkgver}.tar.gz")

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('582935e3a6a889159bc25222b7c150061c6ca176cccefa7174bb941fe3776f96e28aca3d437e6daf91ff1c70150b9986105226b1296b5bb8e84ecfafdbc2ffa6')
