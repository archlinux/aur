# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname='libreoffice-extension-orthos-greek-english-dictionary'
pkgver=0.5.0
pkgrel=8
pkgdesc='Greek/English multilingual dictionary for Libreoffice by the Orthos project'
arch=('any')
url='https://sourceforge.net/projects/orthos-spell/'
license=('BSD-3-Clause AND GPL-1.0-only AND LGPL-2.1-only')
depends=('libreoffice')
groups=('libreoffice-extensions')
source=("https://sourceforge.net/projects/orthos-spell/files/v.${pkgver}/orthos-el_GR-en_US-${pkgver}-${pkgrel}.oxt")
b2sums=('6312672c21713ceef5ffb7f142ef5aa404424a5b1df4bb6b5b0af3228838cc2ecdaac1bee9e2dfad3a98e61baf9e270074812cd0233161220e51c88fc428007a')

package() {
    install -dm755 "${pkgdir}"/usr/lib/libreoffice/share/extensions
    cp -r "${srcdir}" "${pkgdir}"/usr/lib/libreoffice/share/extensions/${pkgname}
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    find "${pkgdir}" \( -name "*~" -o -name "*old" -o -name "*oxt" \) -exec rm "{}" \+
}
