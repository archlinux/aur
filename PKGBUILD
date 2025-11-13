# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname='libreoffice-extension-orthos-greek-dictionary'
pkgver=0.5.0
pkgrel=8
pkgdesc='Greek dictionary for Libreoffice by the Orthos project'
arch=('any')
url='https://sourceforge.net/projects/orthos-spell/'
license=('BSD-3-Clause AND GPL-1.0-only AND LGPL-2.1-only')
depends=('libreoffice')
groups=('libreoffice-extensions')
source=("https://sourceforge.net/projects/orthos-spell/files/v.${pkgver}/orthos-el_GR-${pkgver}-${pkgrel}.oxt")
b2sums=('c5357a03eea04057c620641e046d321ef8a28231591b30f87ffa41fa324104c7eea2140187d825a3d65370e0019f8f9e0123572841744c5118428f5e62408b8b')

package() {
    install -dm755 "${pkgdir}"/usr/lib/libreoffice/share/extensions
    cp -r "${srcdir}" "${pkgdir}"/usr/lib/libreoffice/share/extensions/${pkgname}
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    find "${pkgdir}" \( -name "*~" -o -name "*old" -o -name "*oxt" \) -exec rm "{}" \+
}
