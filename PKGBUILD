pkgname=deskify-bin
pkgver=0.1.1.alpha.1.aur
pkgrel=1
pkgdesc="Turn websites into Linux desktop apps (prebuilt binary package)"
arch=('x86_64')
url="https://github.com/spalencsar/deskify"
license=('MIT')
depends=('glibc')
optdepends=('chromium: for --backend chromium')
provides=('deskify')
conflicts=('deskify')

_tag="v0.1.1-alpha.1-aur"
source=("deskify::https://github.com/spalencsar/deskify/releases/download/${_tag}/deskify-linux-x86_64"
        "LICENSE::https://raw.githubusercontent.com/spalencsar/deskify/${_tag}/LICENSE")

sha256sums=('c4e938b7b130529eb50d85ab8797ef5d4c04262c9fcb40519f2e8d87443dc2ab'
            'd4e53458cd2dd461f234186497b6d9b21566c477737a4d31fa6f018ef610486f')

package() {
  install -Dm755 "${srcdir}/deskify" "${pkgdir}/usr/bin/deskify"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
