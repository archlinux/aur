# Maintainer: Ibnu Afdel <ibnu@example.com>
pkgname=pomogo-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A beautiful terminal deep-work companion for developers."
arch=('x86_64' 'aarch64')
url="https://github.com/Ibnu-Afdel/pomogo"
license=('MIT')
optdepends=(
  'libnotify: desktop notification fallback via notify-send'
  'libcanberra: transition sounds via canberra-gtk-play'
)
options=('!debug')
provides=('pomogo')
conflicts=('pomogo')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/Ibnu-Afdel/pomogo/releases/download/v${pkgver}/pomogo-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/Ibnu-Afdel/pomogo/releases/download/v${pkgver}/pomogo-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('2de8cf2895fbd4457040c6157375954f45c66c661166d185f53d7b2ed3c982ee')
sha256sums_aarch64=('0b559fbbd0b59a5375ade97ae67856bc2dfc71e1fe30415387bc62503f1e7c77')

package() {
  install -Dm755 "${srcdir}/pomogo" "${pkgdir}/usr/bin/pomogo"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/pomogo/README.md"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/pomogo/LICENSE"
}
