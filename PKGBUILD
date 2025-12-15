# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: <gilrain +  libre dot arch at castelmo dot re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=2.3.0
pkgrel=1
pkgdesc="French grammar checker extension for LibreOffice."
arch=('any')

url="https://grammalecte.net/"
license=('GPL-3.0-only')

depends=('libreoffice')
makedepends=('unzip')
groups=('libreoffice-extensions')

# conflicts=('libreoffice-extension-languagetool')
provides=('libreoffice-extension-dictionaries-fr')
source=("https://grammalecte.net/oxt/Grammalecte-fr-v${pkgver}.oxt")
sha512sums=('3c1acca57aaeff07e101e6190b99ece7d664ec33a7b0c312331b87e3c5b17b781d2d528bda7240339be1d40f4ebad00e082a25041f786b0829e9a3b04bf5a5bc')

package() {
    install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
    unzip -q ${srcdir}/Grammalecte-fr-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

    # fix world writable bit
    find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}
