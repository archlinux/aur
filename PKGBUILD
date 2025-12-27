# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=kairo
pkgver=0.3.2
pkgrel=1
pkgdesc="CLI and Desktop application for smart URL routing"
arch=("x86_64")
url="https://github.com/aelesbao/kairo"
license=("Apache-2.0")
options=('!strip' '!emptydirs')

source_x86_64=("$url/releases/download/v${pkgver}/${pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('c3190c52518b9fae14031a133c8d266492190d6ecafb5289d511bdc8d28f5422')

package() {
  install -Dm755 kairo kairo-desktop -t "${pkgdir}/usr/bin/"
  install -Dm644 desktop/* -t "${pkgdir}/usr/share/applications/"
  install -Dm644 icons/${pkgname}.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 icons/${pkgname}.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
