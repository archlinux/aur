# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=nerd-fonts-hasklig
pkgver=2.2.2
pkgrel=1
pkgdesc='Patched font Hasklig (Hasklug) from nerd-fonts library'
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
groups=('nerd-fonts')
makedepends=('fontconfig')
source=("Hasklig_${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Hasklig.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('1a81fbdcdfc10fc37ce95ef92d65dc91590881c12ee19e2b43371a035d3b5502'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
    find . -iname '*.otf' -not -iname '*Windows Compatible.otf' -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
