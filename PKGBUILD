# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: <gilrain +  libre dot arch at castelmo dot re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=0.5.18
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
    "http://www.dicollecte.org/grammalecte/oxt/Grammalecte-fr-v${pkgver}.oxt"
)
sha512sums=('6fcd7a7f6fd2bf2a81c385e67fa885b6838d4193e394718bb2f5b411812aa629d3b7fb9f229e8f3a46e6fad9aea1a56a1dc92d01656bbb894205735d6ecd2d60')

package() {
    install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
    unzip -q ${srcdir}/Grammalecte-fr-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

    # fix world writable bit
    find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}
