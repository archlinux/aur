# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=booklit-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="Lit content authoring system"
arch=('x86_64')
url="https://github.com/vito/booklit"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vito/booklit/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/booklit_linux_amd64")
sha256sums=('4741601bb4eccdc9048c28acd3ef9b675f3302c57545267cefa95fe37d0b2a06')
sha256sums_x86_64=('e602e9eb6d2b5cbe87f34b03939161c1dbffc3d60a2d61f71a27b10ef7505f87')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/booklit"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
