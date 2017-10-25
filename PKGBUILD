# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: <gilrain +  libre dot arch at castelmo dot re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=0.6.0
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
sha512sums=('000322e209b173f812561f29e8d4cdd2c68605b6d8594bd27005f53eb0b545a8006c85859bcfa15e5df2a87d152db41500109dbc1b49931830b37ce281e5ac69')

package() {
    install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
    unzip -q ${srcdir}/Grammalecte-fr-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

    # fix world writable bit
    find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}
