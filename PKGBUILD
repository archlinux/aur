# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=nerd-fonts-hasklig
pkgver=2.1.0
pkgrel=1
pkgdesc='Patched font Hasklig (Hasklug) from nerd-fonts library'
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
groups=('nerd-fonts')
makedepends=('fontconfig')
source=("Hasklig_${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Hasklig.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
sha256sums=('73a7387e9569ab33bee5aebb62ef86762c2e77084799760e41f61250c107cb6f'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

package() {
    find . -iname '*.otf' -not -iname '*Windows Compatible.otf' -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
