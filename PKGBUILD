# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=collidertracker-bin
pkgver=4.5.3
pkgrel=1
pkgdesc="Terminal music tracker using SuperCollider for synthesis"
arch=('x86_64')
url="https://github.com/schollz/collidertracker"
license=('MIT')
depends=('supercollider')
optdepends=('sc3-plugins: extra SuperCollider UGens')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/schollz/collidertracker/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/collidertracker_linux_static.zip")
sha256sums=('528836b889665b7f29a69166930adb1ffdfe62f18d3cb97a95a52f59f579a6a0')
sha256sums_x86_64=('ec92661c45f6c9db800c6b89150f6f06d7749f51fac8493fee683474aa8f70bd')

package() {
  install -Dm755 "collidertracker" "${pkgdir}/usr/bin/collidertracker"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
