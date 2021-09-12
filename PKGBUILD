# Maintainer: Evgeniy Alekseev

pkgname=python-aioauth-client
_pkgname=aioauth-client
pkgver=0.25.10
pkgrel=1
pkgdesc="OAuth support for Asyncio/Trio libraries"
arch=('any')
url="https://github.com/klen/aioauth-client"
license=('MIT')
depends=('python-httpx')
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

sha512sums=('6f49a1789623f113343c1fb4018e1b6b1f44b1233712421bff568174231a3c3c6fb364a3c3f7288dc0d3d1c09ae31c2f43a4c08b2d75815654fd4dc6bca84284')
