# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: <gilrain +  libre dot arch at castelmo dot re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=2.1.1
pkgrel=1
pkgdesc="French grammar checker extension for LibreOffice."
arch=('any')

url="https://grammalecte.net/"
license=('GPL3')

depends=('libreoffice')
makedepends=('unzip')
groups=('libreoffice-extensions')

# conflicts=('libreoffice-extension-languagetool')
provides=('libreoffice-extension-dictionaries-fr')
source=("https://grammalecte.net/grammalecte/oxt/Grammalecte-fr-v${pkgver}.oxt")
sha512sums=('f53149ed672e354b2bdeb11f824eeecea5471c0557fe06aefbdfddaefb91ab5e0b12a0e4f169f34654b05f8908cc8420c4a8a62d0e22b2fb07841fa5f0595877')

package() {
    install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
    unzip -q ${srcdir}/Grammalecte-fr-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

    # fix world writable bit
    find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}
