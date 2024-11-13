# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname="clipton"
pkgdesc="Clipboard manager with a Rofi frontend"
pkgver=51
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/clipton"
license=("Unlicense")
depends=("rofi" "xclip")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('c6faa40dad96354d0de5e184edb3990c3b3a6015b070382fc4530a734a703197')

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m755 clipton.py "${pkgdir}/usr/bin/clipton"

  install -D -m644 clipton.service "${pkgdir}/usr/lib/systemd/user/clipton.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
