# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: <gilrain +  libre dot arch at castelmo dot re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=1.11.0
pkgrel=1
pkgdesc="French grammar checker extension for LibreOffice."
arch=('any')

url="https://grammalecte.net/"
license=('GPL3')

depends=('libreoffice')
makedepends=('unzip')
groups=('libreoffice-extensions')

conflicts=('libreoffice-extension-languagetool')
provides=('libreoffice-extension-dictionaries-fr')
source=("https://grammalecte.net/grammalecte/oxt/Grammalecte-fr-v${pkgver}.oxt")
sha512sums=('fd29a2b50f969cf0e5fda980b2ee75aaf0ab0e5104e70bd1fe3775b4b0fb0ce70e1ae1675da1259d8702191784e5cd6d08fb3f79537798b332391fb4fe46b850')

package() {
    install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
    unzip -q ${srcdir}/Grammalecte-fr-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

    # fix world writable bit
    find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}
