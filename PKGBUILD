# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ttf-sil-abyssinica
_fname=AbyssinicaSIL
pkgver=1.500
pkgrel=5
pkgdesc="OpenType calligraphic font for Ethiopic languages from SIL"
arch=('any')
url="http://scripts.sil.org/cms/scripts/page.php?item_id=${_fname}"
license=('ofl')
depends=('fontconfig' 'xorg-font-utils')
conflicts=()
install=ttf.install
source=("http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=${_fname}-${pkgver}.zip&filename=${_fname}-${pkgver}.zip"
        'LICENSE::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt')
sha256sums=('e48a77d5ab8ee0b06464a5b29be70f292aa25dc1e73eb39ec933bd7fa47bbd86'
            'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3')

package() {
    cd "${srcdir}"
    find -type f -name '*.ttf' -execdir \
        install -Dm644 {} ${pkgdir}/usr/share/fonts/TTF/{} \;
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
