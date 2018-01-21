# Maintainer: Muhkoenig

pkgname=nerd-fonts-fira-mono
pkgver=1.2.0
pkgrel=1
pkgdesc="Patched font Fira Mono from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils' 'wget')
install=$pkgname.install
source=(
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha256sums=('77ffee4498e23e3215edc9ea6eefa9f10b03deb6815dc3ccb9ad3336cd478f5c'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/OTF
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
