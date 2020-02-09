# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
# Contributor: Sri Harsha <toletysriharsha9@gmail.com>
pkgname=nerd-fonts-iosevka
pkgver=2.1.0
pkgrel=1
pkgdesc='Patched Iosevka font from the nerd-fonts library'
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
install=$pkgname.install
source=("Iosevka-v${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Iosevka.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v${pkgver}/LICENSE")
sha256sums=('6bd29ef886b808d1d76dd85f82b8823452265fda582801734aab6f9460270de3'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

prepare() {
    cd ${srcdir}
    find -name '*Windows*' -delete
}

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}"/*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

