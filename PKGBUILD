# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname='libreoffice-extension-orthos-greek-cypriot-dictionary'
pkgver=0.5.0
pkgrel=8
pkgdesc='Greek/Cypriot dictionary for Libreoffice by the Orthos project'
arch=('any')
url='https://sourceforge.net/projects/orthos-spell/'
license=('BSD-3-Clause AND GPL-1.0-only')
depends=('libreoffice')
groups=('libreoffice-extensions')
source=("https://sourceforge.net/projects/orthos-spell/files/v.${pkgver}/orthos-el_GR-el_CY-${pkgver}-${pkgrel}.oxt")
b2sums=('68d54bd594eef9d4e5adde63fc9c0111e20a9d95280b6450f042125861cd5493bb7fe246ed3772dfea53945114562b2e47ca989098e201a94f51cd5ee16588fb')

package() {
    install -dm755 "${pkgdir}"/usr/lib/libreoffice/share/extensions
    cp -r "${srcdir}" "${pkgdir}"/usr/lib/libreoffice/share/extensions/${pkgname}
#     install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    find "${pkgdir}" \( -name "*~" -o -name "*old" -o -name "*oxt" \) -exec rm "{}" \+
}
