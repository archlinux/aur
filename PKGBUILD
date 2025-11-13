# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname='libreoffice-extension-orthos-greek-thesaurus'
pkgver=0.5.0
pkgrel=8
pkgdesc='Greek thesaurus for Libreoffice by the Orthos project'
arch=('any')
url='https://sourceforge.net/projects/orthos-spell/'
license=('LGPL-2.1-only')
depends=('libreoffice')
groups=('libreoffice-extensions')
source=("https://sourceforge.net/projects/orthos-spell/files/v.${pkgver}/orthos-thesaurus-${pkgver}-${pkgrel}.oxt")
b2sums=('e62a160f097ae17c506f0e5b030fefff6a469f7947d8f8446910109833f822c06df5be45b1ae544d5fbc649aca4364e2c6fd1b09e0f6f3f819115bba906290cf')

package() {
    install -dm755 "${pkgdir}"/usr/lib/libreoffice/share/extensions
    cp -r "${srcdir}" "${pkgdir}"/usr/lib/libreoffice/share/extensions/${pkgname}
    find "${pkgdir}" \( -name "*~" -o -name "*old" -o -name "*oxt" \) -exec rm "{}" \+
}
