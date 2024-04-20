# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname="clipton"
pkgdesc="Clipboard manager with a Rofi frontend"
pkgver=47
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/clipton"
license=("Unlicense")
depends=("rofi" "xclip")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('6a702466e292c71017c329919ad5d1272228ce2d889306fb6bee7085c2b3396a')

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m755 clipton.py "${pkgdir}/usr/bin/clipton"

  install -D -m644 clipton.service "${pkgdir}/usr/lib/systemd/user/clipton.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
