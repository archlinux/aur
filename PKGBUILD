# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ttf-sil-abyssinica
_fname=AbyssinicaSIL
pkgver=1.500
pkgrel=8
pkgdesc='OpenType calligraphic font for Ethiopic languages from SIL'
arch=('any')
url='http://software.sil.org/abyssinica/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("http://software.sil.org/downloads/r/abyssinica/${_fname}-${pkgver}.zip")
sha256sums=('e48a77d5ab8ee0b06464a5b29be70f292aa25dc1e73eb39ec933bd7fa47bbd86')

package() {
    cd "${_fname}-${pkgver}"
    find -type f -name "${_fname}*.ttf" -execdir \
        install -Dm644 {} ${pkgdir}/usr/share/fonts/TTF/{} \;
    install -Dm644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
