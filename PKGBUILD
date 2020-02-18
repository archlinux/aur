# Maintainer: Owen D'Aprile <owendaprile at gmail dot com>
# Adapted from PKGBUILD for nerd-fonts-fira-code (https://aur.archlinux.org/packages/nerd-fonts-fira-code/)

pkgname=nerd-fonts-cascadia-code
pkgver=2.1.0
pkgrel=1
pkgdesc="Patched Cascadia Code font with extra glyphs"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
depends=("fontconfig")
provides=("nerd-fonts-cascadia-code")
conflicts=("nerd-fonts-complete"
           "nerd-fonts-git")
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/CascadiaCode.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v${pkgver}/LICENSE")
sha256sums=("92b50960305c580fc90bb3bd5456e26edc9b321907dfa2578066a9b38e2a94e0"
            "d2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5")

package() {
    find . -iname "*.ttf" -not -iname "*Windows Compatible*" -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/TTF/{}" \;
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
