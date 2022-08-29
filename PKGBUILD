# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=nerd-fonts-hasklig
pkgver=2.2.1
pkgrel=1
pkgdesc='Patched font Hasklig (Hasklug) from nerd-fonts library'
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
groups=('nerd-fonts')
makedepends=('fontconfig')
source=("Hasklig_${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Hasklig.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('cbb9b6f45c38c82d22c8e5130f93338b4663935277391d62e9234f4a1509f862'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
    find . -iname '*.otf' -not -iname '*Windows Compatible.otf' -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
