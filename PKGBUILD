# Maintainer: Thomas Antoniou <info@quelotic.dev>

pkgname=nerd-fonts-hermit
pkgver=2.1.0
pkgrel=2
pkgdesc="Patched font Hermit (Hurmit) from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
makedepends=("fontconfig") 
source=("Hermit-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Hermit.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
sha256sums=("551fcb801963cd5ced87a85d135589053bbd23b6f5674ddb985d9e50b2bc49c6"
            "d2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5")

package() {
    find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
