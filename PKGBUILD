pkgname=nerd-fonts-cascadia-code
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched Cascadia Code font with extra glyphs"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
depends=("fontconfig")
provides=("nerd-fonts-cascadia-code")
conflicts=("nerd-fonts-complete" "nerd-fonts-git")
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/CascadiaCode.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/LICENSE")
sha256sums=("b4f4f20ab6bbf55dd9ae7dd1fadd4ef2c608f38922c401afcce373b36a9b0407"
            "245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360")

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible*" -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
