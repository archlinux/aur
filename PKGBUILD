pkgname=nerd-fonts-cascadia-code
pkgver=2.3.0
pkgrel=2
pkgdesc="Patched Cascadia Code (Caskaydia Cove) font with extra glyphs"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
depends=("fontconfig")
conflicts=("nerd-fonts-complete" "nerd-fonts-git")
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/CascadiaCode.zip")
sha256sums=("417c3e57a1185bcd432592fa7e1c182ac2ccd559e79ba25a5f7778ee346206f8")

prepare() {
  find "${srcdir}" -name '*Windows*' -delete
}

package() {
  install -Dm644 *.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
