# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=nerd-fonts-hasklig
pkgver=2.3.1
pkgrel=1
pkgdesc='Patched font Hasklig (Hasklug) from nerd-fonts library'
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
groups=('nerd-fonts')
makedepends=('fontconfig')
source=("Hasklig_${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Hasklig.zip"
        "LICENSE_${pkgver}.txt::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('86d6630ae872706d248ac19c6b2c3d6d1533f3f3d257e32b6e218ee95e383f20'
            '1f6ad4edae6479aaace3112ede5279a23284ae54b2a34db66357aef5f64df160')

package() {
    find . -iname '*.otf' -not -iname '*Windows Compatible.otf' -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
    install -Dm644 "LICENSE_${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
