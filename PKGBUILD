# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: <gilrain +  libre dot arch at castelmo dot re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=0.6.4.2
pkgrel=1
pkgdesc="French grammar checker extension for LibreOffice."
arch=('any')

url="http://www.dicollecte.org/grammalecte/"
license=('GPL3')

depends=('libreoffice')
makedepends=('unzip')
groups=('libreoffice-extensions')

conflicts=('libreoffice-extension-languagetool')
provides=('libreoffice-extension-dictionaries-fr')
source=(
    "https://www.dicollecte.org/grammalecte/oxt/Grammalecte-fr-v${pkgver}.oxt"
)
sha512sums=('00cd21efa5918315f06bbbfe238a9cde51c71d0e52ffa3538cf0fa0d8d130e8dde7bb5fa5c75aab3fc60268aad35674755ee5b0b39eb73f1ddb33fe845e9cd90')

package() {
    install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
    unzip -q ${srcdir}/Grammalecte-fr-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

    # fix world writable bit
    find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}
