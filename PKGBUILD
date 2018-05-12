# Maintainer: Muhkoenig

pkgname=nerd-fonts-bitstream-vera-mono
pkgver=2.0.0
pkgrel=1
pkgdesc="Patched font Bitstream Vera Mono from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils' 'wget')
install=$pkgname.install
source=(
    "BitstreamVeraSansMono-v$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/BitstreamVeraSansMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha256sums=(
    '285c7c08ee2d651cf1f0bdb8a83b787adcab2449ac09b04c23aa4ae17a50d84b'
    'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
