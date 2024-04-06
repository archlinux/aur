# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname="clipton"
pkgdesc="Clipboard manager based on rofi"
pkgver=45
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/clipton"
license=("Unlicense")
depends=("rofi" "xclip" "copyevent-git")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('d2e409192fe3a0d89aa758d2b7a5eba9b07ff5b53d74e988dd402607e2c61114')

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m755 clipton.py "${pkgdir}/usr/bin/clipton"

  install -D -m644 clipton.service "${pkgdir}/usr/lib/systemd/user/clipton.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
