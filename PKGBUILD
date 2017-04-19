# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor: Firmicus <firmicus āt gmx dōt net>

pkgname=ttf-sil-lateef
_fname=LateefGR
pkgver=1.200
pkgrel=1
pkgdesc='OpenType Arabic font from SIL'
arch=('i686' 'x86_64')
url='http://software.sil.org/lateef/'
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-sil-arabic' 'ttf-sil-fonts')
install=ttf.install
source=("http://software.sil.org/downloads/r/lateef/${_fname}-${pkgver}.zip"
        'LICENSE::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt')
sha256sums=('ef6c6b4b4cb8d8502c78efc43cb99d29f391e6cb9eba1b133a661ffda3ddc7e1'
            'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3')

package() {
    cd "${_fname}-${pkgver}"
    install -Dm644 ${_fname}-Regular.ttf ${pkgdir}/usr/share/fonts/TTF/${_fname}-Regular.ttf
    install -Dm644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
