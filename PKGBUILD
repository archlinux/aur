# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: <gilrain +  libre dot arch at castelmo dot re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=1.0.1
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
sha512sums=('ced775b79ba9b5aa7890bc0ce43ac02d1d0af0b549782e719969f0e21b704278f66b7ae2dc2aa1a91f91f9a27841625a63d44bbc4bd79d4574fd2148d8af6413')

package() {
    install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
    unzip -q ${srcdir}/Grammalecte-fr-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

    # fix world writable bit
    find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}
