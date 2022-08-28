pkgname=nerd-fonts-cascadia-code
pkgver=2.2.1
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
sha256sums=("06039f286c247cc5606bbc8267cdefcc01d1a1955b8da597a11c6b6fdc480c65"
            "245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360")

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible*" -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
