pkgname=deskify-bin
pkgver=0.1.0.alpha.9
pkgrel=1
pkgdesc="Turn websites into Linux desktop apps (prebuilt binary package)"
arch=('x86_64')
url="https://github.com/spalencsar/deskify"
license=('MIT')
depends=('glibc')
optdepends=('chromium: for --backend chromium')
provides=('deskify')
conflicts=('deskify')

_tag="v0.1.0-alpha.9"
source=("deskify::https://github.com/spalencsar/deskify/releases/download/${_tag}/deskify-linux-x86_64"
        "LICENSE::https://raw.githubusercontent.com/spalencsar/deskify/${_tag}/LICENSE")

sha256sums=('b7716fc5df6b3d55455d9513769d2d623155433b22307db305ebe09c654bf3d3'
            'd4e53458cd2dd461f234186497b6d9b21566c477737a4d31fa6f018ef610486f')

package() {
  install -Dm755 "${srcdir}/deskify" "${pkgdir}/usr/bin/deskify"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
