pkgname=nerd-fonts-cascadia-code
pkgver=2.3.1
pkgrel=1
pkgdesc="Patched Cascadia Code (Caskaydia Cove) font with extra glyphs"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
depends=("fontconfig")
conflicts=("nerd-fonts-complete" "nerd-fonts-git")
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/CascadiaCode.zip")
sha256sums=("cf6cbed1f52fe7f9085df4e9cc2d5da5e56d82b3c048a39832a5b5dbfd636022")

prepare() {
  find "${srcdir}" -name '*Windows*' -delete
}

package() {
  install -Dm644 *.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
