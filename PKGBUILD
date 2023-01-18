pkgname=nerd-fonts-cascadia-code
pkgver=2.3.0
pkgrel=1
pkgdesc="Patched Cascadia Code (Caskaydia Cove) font with extra glyphs"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
depends=("fontconfig")
conflicts=("nerd-fonts-complete" "nerd-fonts-git")
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/CascadiaCode.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/LICENSE")
sha256sums=("417c3e57a1185bcd432592fa7e1c182ac2ccd559e79ba25a5f7778ee346206f8"
            "1f6ad4edae6479aaace3112ede5279a23284ae54b2a34db66357aef5f64df160")

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible*" -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
