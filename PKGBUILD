# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Co-Maintainer: derchef <mjindra (at) derchef (dot) email>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ray Rashif <schiv at archlinux dot org>
# Contributor: Brad Fanella <bradfanellaat archlinux dot us>
# See .contrib for older/other contributors
pkgname=eric
pkgver=22.8.1
pkgrel=1
pkgdesc="A full-featured Python and Ruby IDE in PyQt"
arch=('any')
url="https://${pkgname}-ide.python-projects.org/"
license=('GPL3')
depends=('python-qscintilla-qt6' 'python-pyqt6-webengine' 'python-pyqt6-charts' 'qt6-tools' 'qt6-svg' 'python-editorconfig' 'python-asttokens')
makedepends=('python-pip')
conflicts=(${pkgname}-common)
replaces=(${pkgname}-common)
source=("https://downloads.sourceforge.net/${pkgname}-ide/${pkgname}7-${pkgver}.tar.gz")
sha256sums=('4b163c3948eb2790203c18aa79a2c55c419c952b3d43b1c33c8f83d1c8abaab7')

package_eric() {
    cd "${pkgname}7-${pkgver}"

    python install.py -c -b "/usr/bin" -i "${pkgdir}"

    # fix paths in desktop files
    find "${pkgdir}" -name '*.desktop' -exec sed -i "s|${pkgdir}||g" {} \;
}

