# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
# Contributor: Sri Harsha <toletysriharsha9@gmail.com>
pkgname=nerd-fonts-iosevka
pkgver=2.0.0
pkgrel=2
pkgdesc="Patched Iosevka font from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
install=$pkgname.install
source=("Iosevka-v${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Iosevka.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v${pkgver}/LICENSE")
sha256sums=('a67d9e2d66146e7f38ef0d19cda5d7f81cb769ea1e6716b545b30412ae8823a0'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

prepare() {
    cd ${srcdir}
    find -name '*Windows*' -delete
}

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}

